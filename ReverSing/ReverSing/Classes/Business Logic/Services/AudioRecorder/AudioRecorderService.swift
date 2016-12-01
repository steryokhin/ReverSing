//
// Created by Sergey Teryokhin on 21/11/2016.
// Copyright (c) 2016 iMacDev. All rights reserved.
//

import QorumLogs
import AudioKit
import Foundation

/**
 * AudioKit based implementation of the AudioRecorderServiceProtocol protocol
 */
class AudioRecorderService : AudioRecorderServiceProtocol {
    fileprivate let dataProvider: AudioRecorderServiceDataProvider
    
        init() {
            /// Setup settings
            AKSettings.bufferLength = .medium
    
            do {
                try AKSettings.setSession(category: .record)//, with: .defaultToSpeaker)
            } catch {
                QL4("Errored setting category.")
            }
    
            /// Setup nodes
            let microphone: AKMicrophone = AKMicrophone()
            let micMixer = AKMixer(microphone)
            let tracker = AKFrequencyTracker.init(microphone)
            let booster = AKBooster(micMixer)
            booster.gain = 0
            
            let recorder: AKNodeRecorder? = try? AKNodeRecorder(node: micMixer)

            self.dataProvider = AudioRecorderServiceDataProvider(withMicrophone: microphone, tracker: tracker, booster: booster, recorder: recorder)

            AudioKit.start()
        }

    deinit {
        AudioKit.stop()
    }
    
    //MARK: AudioRecorderServiceProtocol
    var source: AnyObject {
        return self.dataProvider.microphone
    }

    var booster: AKBooster {
        return self.dataProvider.sound
    }
    
    func start() {
        guard let recorder = self.dataProvider.recorder else {
            QL3("Recorder does not set")
            return
        }
        
        if !self.isRecording() {
            do {
                self.dataProvider.sound.gain = 0
                try recorder.reset()
                try recorder.record()
            } catch {
                QL4("Errored recording.")
            }
        }
    }

    func stop() -> AKAudioFile? {
        guard let recorder = self.dataProvider.recorder else {
            QL3("Recorder does not set")
            return nil
        }
        
        if self.isRecording() {
            recorder.stop()
        }

        return recorder.audioFile
    }
    
    func isRecording() -> Bool {
        guard let recorder = self.dataProvider.recorder else {
            QL3("Recorder does not set")
            return false
        }
        
        return recorder.isRecording
    }
}
