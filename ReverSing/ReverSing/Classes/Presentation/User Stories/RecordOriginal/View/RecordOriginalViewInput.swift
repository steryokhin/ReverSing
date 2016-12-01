//
//  RecordOriginalRecordOriginalViewInput.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

protocol RecordOriginalViewInput: class {

    /**
        @author Sergey Teryokhin
        Setup initial state of the view
    */
    func setupInitialState(_ model: RecordOriginalModel, service: AudioRecorderServiceProtocol)

    /// Update UI with give model
    func updateWithModel(_ model: RecordOriginalModel)
}
