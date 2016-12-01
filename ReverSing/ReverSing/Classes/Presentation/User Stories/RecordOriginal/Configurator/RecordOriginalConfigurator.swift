//
//  RecordOriginalRecordOriginalConfigurator.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit

class RecordOriginalModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RecordOriginalViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RecordOriginalViewController) {

        let router = RecordOriginalRouter()
        router.transitionHandler = viewController

        let presenter = RecordOriginalPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RecordOriginalInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
