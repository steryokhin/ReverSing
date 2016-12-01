//
//  RecordOriginalRecordOriginalViewOutput.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 16/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

protocol RecordOriginalViewOutput {

    /**
        @author Sergey Teryokhin
        Notify presenter that view is ready
    */
    func viewIsReady()
    
    /// notify presenter about closing view
    func viewCloseTriggered()
    
    /// Request presenter to change recording status
    func viewStartStopRecordingAction()

    /// Request presenter to play recorded audio
    func viewStartStopPlayingAction()
}
