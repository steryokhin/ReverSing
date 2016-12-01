//
//  AKAudioPlayerService.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 30/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioPlayer
import AudioKit
import Foundation

/// Service class to play audio implemented with AudioPlayer cocoapods component
class AKAudioPlayerService : AudioPlayerServiceProtocol {
    @available(*, unavailable, message: "Use designated initialiser")
    init() {
        fatalError()
    }
    
    let audioFile: AKAudioFile!
    let player: AKAudioPlayer?
    
    init(audioFile: AKAudioFile) {
        self.audioFile = audioFile
        
        self.player = try? AKAudioPlayer(file: audioFile)
        
        AudioKit.stop()
        AudioKit.output = self.player
        AudioKit.start()
    }
    
    // Play recorded data
    func play() {
        self.player?.play()
    }
    
    // pause playback
    func pause() {
        self.player?.pause()
    }
    
    // stop playback and reset to start position
    func stop() {
        self.player?.stop()
    }
    
    func isPlaying() -> Bool {
        guard let myPlayer = self.player else {
            return false
        }
        
        return myPlayer.isPlaying
    }

    func audioFileURL() -> URL {
        return self.audioFile.url
    }

//    func audioFile() -> AKAudioFile {
//        return audioFile
//    }
}
