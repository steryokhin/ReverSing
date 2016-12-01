//
//  RecordOriginalRecordOriginalInteractor.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit

class RecordOriginalInteractor: RecordOriginalInteractorInput {

    weak var output: RecordOriginalInteractorOutput!

    func requestAudioRecorder() {
        let audioServie = AudioRecorderService()

        self.output.interactorAudioRecorderService(audioServie)
    }
}
