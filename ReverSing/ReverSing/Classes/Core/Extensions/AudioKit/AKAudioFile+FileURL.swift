//
//  AKAudioFile+FileURL.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 01/12/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

import AudioKit

// This extension is required to fix avasset loading issue.
// Using URL directly does not works (track does not loaded from AVAsset )
extension AKAudioFile {
    /// http://stackoverflow.com/questions/21463250/cocoa-avasset-loaded-from-file-has-0-tracks
    var fileURL: URL {
        let urlString = self.url.absoluteString
        
        return URL(fileURLWithPath: urlString)
    }
}
