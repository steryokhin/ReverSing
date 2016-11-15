//
//  HomeHomePresenter.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import QorumLogs

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {
        QL2("Home hierarchy loaded")
    }
    
    func play() {
        QL2("Play button pressed")
        
        self.router.startGame()
    }
}
