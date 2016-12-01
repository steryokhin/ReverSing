//
//  RecordOriginalRecordOriginalConfiguratorTests.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import XCTest

class RecordOriginalModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = RecordOriginalViewControllerMock()
        let configurator = RecordOriginalModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "RecordOriginalViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RecordOriginalPresenter, "output is not RecordOriginalPresenter")

        let presenter: RecordOriginalPresenter = viewController.output as! RecordOriginalPresenter
        XCTAssertNotNil(presenter.view, "view in RecordOriginalPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RecordOriginalPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RecordOriginalRouter, "router is not RecordOriginalRouter")

        let interactor: RecordOriginalInteractor = presenter.interactor as! RecordOriginalInteractor
        XCTAssertNotNil(interactor.output, "output in RecordOriginalInteractor is nil after configuration")
    }

    class RecordOriginalViewControllerMock: RecordOriginalViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
