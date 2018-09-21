//
//  SECSpeaker.swift
//  SEC Challenge
//
//  Created by SEC2018 on 9/19/18.
//  Copyright © 2018 SEC2018. All rights reserved.
//

import Foundation

struct SECSpeaker: Equatable {
    let name: String?
    let position: String?
    let avatarURL: URL?
    
    static func == (lhs: SECSpeaker, rhs: SECSpeaker) -> Bool {
        return lhs.name == rhs.name && lhs.position == rhs.position
    }
}
