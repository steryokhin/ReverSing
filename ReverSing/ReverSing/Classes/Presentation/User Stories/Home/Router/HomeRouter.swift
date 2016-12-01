//
//  HomeHomeRouter.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import QorumLogs
import ViperMcFlurry

class HomeRouter: HomeRouterInput {
    let storyBoard = R.storyboard.main()
    let moduleID = R.storyboard.main.recordOriginalViewControllerID.identifier
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    var transitionModuleFactory: RamblerViperModuleFactory {
        let factory = RamblerViperModuleFactory(storyboard: storyBoard, andRestorationId: moduleID)
        return factory!
    }
    
    func startGame(delegate: RamblerViperModuleOutput) {
        transitionHandler.openModule!(usingFactory: transitionModuleFactory) { sourceModuleTransitionHandler, destinationModuleTransitionHandler in
            let sourceVC = sourceModuleTransitionHandler as! UIViewController
            let destinationVC = destinationModuleTransitionHandler as! UIViewController
            sourceVC.navigationController?.pushViewController(destinationVC, animated: true)
//            destinationVC.forceRotateDeviceToOrientation(toRotation: destinationVC.preferredDeviceOrientationForPresentation(), fromOrientation: sourceVC.preferredDeviceOrientationForPresentation())
        }.thenChain { moduleInput in
            guard let myModuleInput = moduleInput as? RecordOriginalModuleInput else {
                return nil
            }
                
            myModuleInput.configure()
            myModuleInput.setModuleOutput!(delegate)//TODO: setModuleOutput
            
            return delegate
        }
    }
}
