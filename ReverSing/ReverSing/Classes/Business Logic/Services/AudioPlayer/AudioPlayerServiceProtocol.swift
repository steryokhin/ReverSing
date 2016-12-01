//
//  AudioPlayerServiceProtocol.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 29/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import Foundation

protocol AudioPlayerServiceProtocol {
    // Play recorded data
    func play()

    // pause playback
    func pause()
    
    // stop playback and reset to start position
    func stop()

    // return current status of the playback
    func isPlaying() -> Bool

    /// return URL to connected audio file
    func audioFileURL() -> URL

    var audioFile: AKAudioFile! { get }
}
