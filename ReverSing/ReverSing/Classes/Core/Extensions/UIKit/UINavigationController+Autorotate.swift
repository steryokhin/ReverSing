//
//  UINavigationController+Autorotate.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 17/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import QorumLogs
import UIKit
import Foundation

/// http://stackoverflow.com/questions/25651969/setting-device-orientation-in-swift-ios
extension UINavigationController {
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }

            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
}
