//
//  ThirdPartyAssembly.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 07/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import Typhoon
import Foundation

class ThirdPartyAssembly: TyphoonAssembly, ThirdPartyAssemblyProtocol {
    open dynamic func thirdPartyManager() -> Any {
        return TyphoonDefinition.withClass(ThirdPartyManager.self, configuration: { (definition) in
            if let myDefinition = definition {
                myDefinition.scope = TyphoonScope.singleton
            }
        });
    }
}

