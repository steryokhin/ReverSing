//
//  HomeHomeViewController.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: HomeViewInput
    func setupInitialState() {
    }
}
