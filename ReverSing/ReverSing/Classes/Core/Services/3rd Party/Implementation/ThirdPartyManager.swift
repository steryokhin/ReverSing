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

/**
 * Loading and initialising third part libraries
 */
@objc
class ThirdPartyManager: NSObject, ThirdPartyManagerProtocol {
    var watchdog: Watchdog?
    
    func configure() {
        self.setupWatchdog()
        self.setupLogging()
    }
    
    func setupWatchdog() {
        self.watchdog = Watchdog(threshold: 0.5, strictMode: false)
    }
    
    func setupLogging() {
#if DEBUG
        //TODO: 1 and 3 ==> make constants
        QorumLogs.minimumLogLevelShown = 1
#else
        QorumLogs.minimumLogLevelShown = 3
#endif
        QorumLogs.enabled = true
        QorumLogs.test()
    }
}
