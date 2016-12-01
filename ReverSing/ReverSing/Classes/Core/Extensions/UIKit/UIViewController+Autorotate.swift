//
//  UIViewController+Autorotate.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 18/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit

extension UIViewController {
    public func isCurrentOrientationSupported() -> Bool {
        var deviceInterfaceOrientationMask : UIInterfaceOrientationMask
        switch (UIDevice.current.orientation) {
        case UIDeviceOrientation.portrait:
            deviceInterfaceOrientationMask = UIInterfaceOrientationMask.portrait
        case UIDeviceOrientation.portraitUpsideDown:
            deviceInterfaceOrientationMask = UIInterfaceOrientationMask.portraitUpsideDown
        case UIDeviceOrientation.landscapeLeft:
            deviceInterfaceOrientationMask = UIInterfaceOrientationMask.landscapeLeft
        case UIDeviceOrientation.landscapeRight:
            deviceInterfaceOrientationMask = UIInterfaceOrientationMask.landscapeRight
        default:
            deviceInterfaceOrientationMask = UIInterfaceOrientationMask.portrait
        }
        return (Int(deviceInterfaceOrientationMask.rawValue) & Int(supportedInterfaceOrientations.rawValue)) != 0
    }

    public func preferredDeviceOrientationForPresentation() -> UIDeviceOrientation {
        switch (preferredInterfaceOrientationForPresentation) {
        case UIInterfaceOrientation.portrait:
            return UIDeviceOrientation.portrait
        case UIInterfaceOrientation.portraitUpsideDown:
            return UIDeviceOrientation.portraitUpsideDown
        case UIInterfaceOrientation.landscapeLeft:
            return UIDeviceOrientation.landscapeLeft
        case UIInterfaceOrientation.landscapeRight:
            return UIDeviceOrientation.landscapeRight
        default:
            return UIDeviceOrientation.portrait
        }
    }

    func forceOrientation(newOrientation: UIDeviceOrientation) {
        let orientationKey = "orientation"

        UIDevice.current.setValue(newOrientation.rawValue, forKey: orientationKey)
        UIViewController.attemptRotationToDeviceOrientation()
    }

    func forceRotateDeviceToOrientation(toRotation: UIDeviceOrientation, fromOrientation: UIDeviceOrientation) {
        let orientationKey = "orientation"

        let actualDeviceOrientation = UIDevice.current.orientation
        var changedDeviceOrientation = false
        if actualDeviceOrientation != toRotation {
            UIDevice.current.setValue(toRotation.rawValue, forKey: orientationKey)
        } else {
            UIDevice.current.setValue(fromOrientation.rawValue, forKey: orientationKey)
            changedDeviceOrientation = true
        }
        UIViewController.attemptRotationToDeviceOrientation()
        if changedDeviceOrientation {
            UIDevice.current.setValue(actualDeviceOrientation.rawValue, forKey: orientationKey)
        }
    }
}
