//
//  RecordOriginalModel+Equatable.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 30/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import Foundation

/// Adding Equatable compatibility to the RecordOriginalModel
/// TODO: do we need separate comparators for optionals?
extension RecordOriginalModel : Equatable {}

func ==(lhs: RecordOriginalModel, rhs: RecordOriginalModel) -> Bool {
    let areEqual: Bool = lhs.isAudioReady == rhs.isAudioReady &&
            lhs.isPlaying == rhs.isPlaying &&
            lhs.isRecording == rhs.isRecording &&
            lhs.audioFile == rhs.audioFile

    return areEqual
}
