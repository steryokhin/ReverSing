//
//  RecordOriginalRecordOriginalPresenter.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import ViperMcFlurry
import QorumLogs

class RecordOriginalPresenter: NSObject, RecordOriginalModuleInput, RecordOriginalViewOutput, RecordOriginalInteractorOutput {
    /// VIPER modules
    weak var view: RecordOriginalViewInput!
    var interactor: RecordOriginalInteractorInput!
    var router: RecordOriginalRouterInput!
    
    var moduleOutput: RecordOriginalModuleOutput?
    
    var model: RecordOriginalModel?

    /// Service variables
    var recorderService: AudioRecorderServiceProtocol?
    var playerService: AudioPlayerServiceProtocol?

    func configure() {
        QL2("RecordOriginal ready for use");
    }

    //MARK: RecordOriginalViewOutput protocol
    func viewIsReady() {
        self.interactor.requestAudioRecorder()
    }
    
    func viewCloseTriggered() {
        guard let myModuleOutput = self.moduleOutput else {
            return
        }
        
        myModuleOutput.cancelRecordOriginal(module: self.router.transitionHandler)
    }
    
    
    func viewStartStopRecordingAction() {
        guard self.model != nil else {
            QL3("Model is not set")
            return
        }
        
        guard let myRecorderService = self.recorderService as AudioRecorderServiceProtocol? else {
            QL3("myService should implement AudioRecorderServiceProtocol")
            return
        }
        
        if myRecorderService.isRecording() {
            let audioFile: AKAudioFile? = myRecorderService.stop()
            
            if let myAudioFile = audioFile {
                self.playerService = AKAudioPlayerService(audioFile: myAudioFile)
            }
        } else {
            myRecorderService.start()
        }

        let newModel = RecordOriginalModel(withRecorderService: myRecorderService, playerService: self.playerService)
        
//        guard let myModel = self.model else {
//            self.model = newModel
//            self.view.updateWithModel(self.model!)
//        }
//        
        if (self.model != newModel) {
            self.model = newModel
            self.view.updateWithModel(self.model!)
        }
    }

    func viewStartStopPlayingAction() {
        guard self.model != nil else {
            QL3("Model is not set")
            return
        }

        guard let myService = self.playerService as AudioPlayerServiceProtocol? else {
            QL3("myService should implement AudioRecorderServiceProtocol")
            return
        }

        //TODO: check that player is ready
        myService.play()
    }
    
    //MARK: routing support.
    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as! RecordOriginalModuleOutput?
    }

    //MARK: interactor output
    func interactorAudioRecorderService(_ service: AudioRecorderServiceProtocol) {
        self.recorderService = service
        
        self.model = RecordOriginalModel(withRecorderService: service, playerService: self.playerService)
        
        self.view.setupInitialState(self.model!, service: service)
    }
}
