//
//  AudioRecorderServiceData.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 24/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import Foundation

/**
 * Incapsulate audio nodes required to record sound
 */
class AudioRecorderServiceDataProvider {
    let microphone: AKMicrophone!
    let tracker: AKFrequencyTracker!
    let sound: AKBooster!
    
    /// Manage recording status and store data to audioFile
    let recorder: AKNodeRecorder?
    
    @available(*, unavailable, message: "Use designated initialiser")
    init() { fatalError() }
    
    init(withMicrophone microphone: AKMicrophone!, tracker: AKFrequencyTracker!, booster: AKBooster!, recorder: AKNodeRecorder?) {
        self.microphone = microphone
        self.tracker = tracker
        self.sound = booster
        self.recorder = recorder
    }
}

