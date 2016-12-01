//
//  HomeHomePresenter.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import ViperMcFlurry
import QorumLogs

class HomePresenter: NSObject, HomeModuleInput, HomeViewOutput, HomeInteractorOutput, RamblerViperModuleOutput, RecordOriginalModuleOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {
        
    }
    
    func play() {
        self.router.startGame(delegate: self)
    }
    
    //MARK: RecordOriginalModuleOutput
    func cancelRecordOriginal(module: RamblerViperModuleTransitionHandlerProtocol) {
        
        module.closeCurrentModule!(true)
    }
}
