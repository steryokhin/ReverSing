//
//  ApplicationLayerAssembly.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 08/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import Foundation
import QorumLogs
import Typhoon

class ApplicationLayerAssembly: TyphoonAssembly, ApplicationLayerAssemblyProtocol {
    var thirdPartyAssembly: ThirdPartyAssembly!


    open dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self, configuration: { (definition) in
            guard  let myDefinition = definition else {
                QL3("myDefinition is not set")
                return
            }

            myDefinition.injectProperty(#selector(ThirdPartyAssembly.thirdPartyManager),
                    with: self.thirdPartyAssembly.thirdPartyManager())
            myDefinition.injectProperty(#selector(getter:AppDelegate.rootNavigationController),
            with: self.rootNavigationController())
            myDefinition.injectProperty(#selector(getter:UIApplicationDelegate.window),
            with: self.mainWindow())

            myDefinition.scope = TyphoonScope.singleton
        })
    }

    open dynamic func rootNavigationController() -> Any {
        return TyphoonDefinition.withClass(UINavigationController.self, configuration: { (definition) in
            guard let myDefinition = definition else {
                QL3("myDefinition is not set")
                return
            }

            myDefinition.useInitializer(#selector(UINavigationController.init(navigationBarClass:toolbarClass:)),
                    parameters: { (initializer) -> Void in
                        initializer?.injectParameter(with: nil)
                        initializer?.injectParameter(with: nil)
                    })
            myDefinition.injectProperty(#selector(getter:UINavigationController.viewControllers), with: [self.homeViewController()])
            myDefinition.scope = TyphoonScope.singleton
        })
    }

    open dynamic func mainStoryboard() -> Any {
        let storyboard: UIStoryboard = R.storyboard.main()
        return storyboard
    }

    open dynamic func mainWindow() -> Any {
        return TyphoonDefinition.withClass((UIWindow.self), configuration: { (definition) -> Void in
            guard let myDefinition = definition else {
                QL3("myDefinition is not set")
                return
            }
            myDefinition.useInitializer(#selector(UIView.init(frame:)), parameters: { (initializer) -> Void in
                initializer?.injectParameter(with: NSValue(cgRect: UIScreen.main.bounds))
            })
            myDefinition.injectProperty(#selector(getter:UIWindow.rootViewController), with: self.rootNavigationController())
            myDefinition.scope = TyphoonScope.singleton
        })
    }

    open dynamic func homeViewController() -> Any {
        return TyphoonDefinition.withFactory(self.mainStoryboard(),
                selector: #selector(UIStoryboard.instantiateViewController(withIdentifier:)),
                parameters: { (method) -> Void in
                    method?.injectParameter(with: "HomeViewControllerID")
                })
    }
}

