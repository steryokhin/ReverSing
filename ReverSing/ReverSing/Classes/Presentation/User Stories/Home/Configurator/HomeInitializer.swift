//
//  HomeHomeInitializer.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var homeViewController: HomeViewController!

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }
}
