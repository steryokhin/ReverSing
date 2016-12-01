//
//  RecordOriginalModel.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 21/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit
import Foundation

/// View Model to display Record Original controller
struct RecordOriginalModel {
    /// Indicate that record is in the progress
    let isRecording: Bool

    /// Indicate that audio is playing
    let isPlaying: Bool

    /// Indicate that audio is ready to play
    let isAudioReady: Bool

    /// audio file URL (if present)
    let audioFile: AKAudioFile?

    @available(*, unavailable, message: "Use designated initialiser")
    init() {
        fatalError()
    }

    /// Model is initiated with audio recorder and audio player services
    init(withRecorderService recorderService: AudioRecorderServiceProtocol, playerService: AudioPlayerServiceProtocol?) {
        self.isRecording = recorderService.isRecording()

        /// If playingService is not set, it is mean that we don't have recorded file and don't have audio to play
        if let myPlayerService = playerService {
            self.isPlaying = myPlayerService.isPlaying()
            self.isAudioReady = true
            self.audioFile = myPlayerService.audioFile
        } else {
            self.isPlaying = false
            self.isAudioReady = false
            self.audioFile = nil
        }
    }
}
