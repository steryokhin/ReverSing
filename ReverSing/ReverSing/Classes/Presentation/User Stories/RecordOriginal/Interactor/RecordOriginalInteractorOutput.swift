//
//  RecordOriginalRecordOriginalInteractorOutput.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import Foundation

protocol RecordOriginalInteractorOutput: class {
    /**
     * Return created and initialised audio service
     */
    func interactorAudioRecorderService(_ service: AudioRecorderServiceProtocol)
}
