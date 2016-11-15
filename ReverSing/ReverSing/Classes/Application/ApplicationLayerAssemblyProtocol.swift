//
//  ApplicationLayerFactoryProtocol.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 07/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit
import Foundation

@objc
protocol ApplicationLayerAssemblyProtocol: class {
    /**
     * Function to create and initialise appDelegate object
     */
    func appDelegate() -> Any

    /**
     * Function to create and initialise navigation controller which become root of the view hierarchy
     */
    func rootNavigationController() -> Any

    /**
     * Function to generate root (home) controller for root navigation controller
     */
    func homeViewController() -> Any
}

