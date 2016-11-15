//
//  HomeHomeViewOutput.swift
//  ReverSing
//
//  Created by Sergey Teryokhin on 15/11/2016.
//  Copyright © 2016 iMacDev. All rights reserved.
//

protocol HomeViewOutput {

    /**
        @author Sergey Teryokhin
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    /**
     * Play button pressed
     */
    func play()
}
