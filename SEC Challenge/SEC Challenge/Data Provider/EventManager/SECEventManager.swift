//
//  SECEventManager.swift
//  SEC Challenge
//
//  Created by SEC2018 on 9/19/18.
//  Copyright © 2018 SEC2018. All rights reserved.
//

import Foundation

class SECEventManager: EventManager {
    
    /**
     Network manager that handles request to "backend"
     */
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getEvents(completion: ([SECEvent]?) -> ()) {
        networkManager.getEvents { [unowned self] (response) in
            completion(self.parse(json: response))
        }
    }
    
    func findEvents(withName name: String, completion: ([SECEvent])->() ) {
        getEvents { (eventList) in
            guard let events = eventList else { return }
            
            let matchingEvents = events.compactMap({ (event) -> SECEvent? in
                guard let eventName = event.name else { return nil }
                return eventName.contains(name) ? event : nil
            })
            
            completion(matchingEvents)
        }
    }
    
    func findEvents(from firstDate: Date, to lastDate: Date, completion: ([SECEvent])->() ) {
        getEvents { (eventList) in
            guard let events = eventList else { return }
            
            let matchingEvents = events.compactMap({ (event) -> SECEvent? in
                guard let date = event.date else { return nil }
                return date > firstDate && date < lastDate ? event : nil
            })
            
            completion(matchingEvents)
        }
    }
    
    func findEvents(fromSpeaker speaker: SECSpeaker, completion: ([SECEvent])->() ) {
        
        getEvents { (eventList) in
            guard let events = eventList else { return }
            let matchingEvents = events.compactMap({ (event) -> SECEvent? in
                guard let speakers = event.speakers else { return nil }
                return speakers.contains(speaker) ? event : nil
            })
            
            completion(matchingEvents)
        }
    }
}

// MARK: event manager helpers
extension SECEventManager {
    
    typealias FileContents = [String:[[String:Any]]]
    
    /**
     Returns array of **SECEvent** items from JSON
     
     - parameter json: Dictionary containing event info
    */
    func parse(json: FileContents) -> [SECEvent]? {
        let parser: JSONParser = SECEventJSONParser()
        return parser.parsed(json: json) as? [SECEvent]
    }
}
