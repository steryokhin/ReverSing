//
//  HomeHomeViewController.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import QorumLogs
import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: Appear/Disappear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }


    // MARK: HomeViewInput
    func setupInitialState() {
    }
    
    @IBAction func play() {
        self.output.play()
    }

    //MARK: rotation
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {        
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portraitUpsideDown
    }    
}
