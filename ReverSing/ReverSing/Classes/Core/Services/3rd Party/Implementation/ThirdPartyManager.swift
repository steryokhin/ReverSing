//
//  ThirdPartyManager.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 07/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//


import Foundation
import UIKit
import Watchdog
import QorumLogs

@objc
class ThirdPartyManager: NSObject, ThirdPartyManagerProtocol {
    var watchdog: Watchdog?
    
    func configureWithAppDelegate(_ appDelegate: UIApplicationDelegate, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        self.setupWatchdog()
        self.setupLogging()
    }
    
    func setupWatchdog() {
        self.watchdog = Watchdog(threshold: 0.5, strictMode: false)
    }
    
    func setupLogging() {
        QorumLogs.enabled = true
        QorumLogs.test()
    }
}
