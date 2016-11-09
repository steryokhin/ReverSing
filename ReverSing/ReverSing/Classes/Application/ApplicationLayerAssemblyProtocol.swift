//
//  ApplicationLayerFactoryProtocol.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 07/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import Foundation

@objc
protocol ApplicationLayerAssemblyProtocol: class {
    func appDelegate() -> Any
}

