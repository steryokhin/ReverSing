//
//  RecordOriginalRecordOriginalInitializer.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import UIKit

class RecordOriginalModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var recordoriginalViewController: RecordOriginalViewController!

    override func awakeFromNib() {

        let configurator = RecordOriginalModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: recordoriginalViewController)
    }

}
