//
//  EventManager.swift
//  SEC Challenge
//
//  Created by SEC2018 on 9/19/18.
//  Copyright © 2018 SEC2018. All rights reserved.
//

import Foundation

protocol EventManager {
    
    /**
     This function makes a request to "backend"
     
     - parameter completion: Completion handler that gets array of **SECEvents** as argument
     */
    func getEvents(completion: ([SECEvent]?)->() )
    
    /**
     This function returns list of **SECEvents**
     
     - parameter name: Name of the **SECEvent**
     */
    func findEvents(withName name: String, completion: ([SECEvent])->() )
    
    /**
     This function returns list of **SECEvents**
     
     - parameter firstDate: Date before the start of the **SECEvent**
     - parameter lastDate: Date after the end of the **SECEvent**
     */
    func findEvents(from firstDate: Date, to lastDate: Date, completion: ([SECEvent])->() )
    
    /**
     This function returns list of **SECEvents**
     
     - parameter speaker: SECSpeaker in list of speakers at the **SECEvent**
     */
    func findEvents(fromSpeaker speaker: SECSpeaker, completion: ([SECEvent])->() )
}
