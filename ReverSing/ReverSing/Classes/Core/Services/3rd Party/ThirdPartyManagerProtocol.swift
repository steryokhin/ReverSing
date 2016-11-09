//
//  ThirdPartyManager.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 07/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit
import Foundation

@objc
protocol ThirdPartyManagerProtocol: class {
    func configureWithAppDelegate(_ appDelegate: UIApplicationDelegate, launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
}
