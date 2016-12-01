//
//  RecordOriginalRecordOriginalViewController.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import FDWaveformView
import AudioKit
import QorumLogs
import UIKit

class RecordOriginalViewController: UIViewController, RecordOriginalViewInput {
    var output: RecordOriginalViewOutput!
    
    fileprivate var audioProvider: AKMicrophone?

    @IBOutlet var recorderOutputHolderView: EZAudioPlot!
    @IBOutlet var recorderButton: UIButton!

    @IBOutlet var playerButton: UIButton!
    @IBOutlet var playerOutputView: FDWaveformView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

    // MARK: RecordOriginalViewInput
    func setupInitialState() {
        //TODO: setup appearance (stylekit)
    }

    //MARK: Interface orientation support
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.landscapeLeft
    }

    //MARK: Actions
    @IBAction func closeAction() {
        self.output.viewCloseTriggered()
    }

    @IBAction func startStopRecordingAction() {
        self.output.viewStartStopRecordingAction()
    }

    @IBAction func startStopPlayingAction() {
        self.output.viewStartStopPlayingAction()
    }

    /// Setup audio wave component
    func setupRecorderPlot(withAudioNode audioNode: AKNode) {
        let plot = AKNodeOutputPlot(audioNode, frame: self.recorderOutputHolderView.bounds)
        plot.plotType = .buffer
        plot.shouldFill = false
        plot.shouldMirror = false
        plot.color = UIColor.blue
        plot.gain = 1.0
        self.recorderOutputHolderView.addSubview(plot)
    }
    
    //MARK: RecordOriginalViewInput protocol implementation
    func setupInitialState(_ model: RecordOriginalModel, service: AudioRecorderServiceProtocol) {
        self.audioProvider = service.source as? AKMicrophone
        
        guard let microphone = self.audioProvider else {
            QL3("Source is not AKMicrophone class")
            return
        }
        
        self.setupRecorderPlot(withAudioNode: microphone)
        self.updateWithModel(model)
    }

    func updateWithModel(_ model: RecordOriginalModel) {
        if (model.isRecording) {
            recorderButton.setTitle("STOP RECORDING", for: UIControlState.normal)
        } else {
            recorderButton.setTitle("START RECORDING", for: UIControlState.normal)
        }

        if model.isAudioReady && !model.isRecording {
            self.displayPlayerPlot(withModel: model)
            self.playerOutputView.isHidden = false
            self.playerButton.isHidden = false
        } else {
            self.playerOutputView.isHidden = true
            self.playerButton.isHidden = true
        }
    }

    func displayPlayerPlot(withModel model: RecordOriginalModel) {
        guard let audioFile = model.audioFile else {
            return
        }

        /// We need this trick to have url in right format
        self.playerOutputView.audioURL = audioFile.fileURL
    }

}
