//
//  AudioRecorderServiceProtocol.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 25/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import Foundation

/**
 * Interface for audio recoding service.
 */
protocol AudioRecorderServiceProtocol : class {
    // It is audio device. AKMicrophone in case of the AudioKit. Usually other classes need access to it to
    // get audio data and statistic
    var source: AnyObject { get }
    var booster: AKBooster { get }


    // Start recording
    func start()

    // Stop recording
    func stop() -> AKAudioFile?
    

    // Current recording state. YES if recording, NO otherwise
    func isRecording() -> Bool
}
