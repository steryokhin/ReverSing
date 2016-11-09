//
//  ApplicationLayerAssembly.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 08/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import Foundation
import Typhoon

class ApplicationLayerAssembly: TyphoonAssembly, ApplicationLayerAssemblyProtocol {
    var thirdPartyAssembly: ThirdPartyAssembly!
    
    open dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self, configuration: { (definition) in
            if let myDefinition = definition {
                myDefinition.injectProperty(#selector(ThirdPartyAssembly.thirdPartyManager), with: self.thirdPartyAssembly.thirdPartyManager())
            }
        })
    }
}

