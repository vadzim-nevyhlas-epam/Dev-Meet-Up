//
//  SECMainViewController.swift
//  SEC Challenge
//
//  Created by SEC2018 on 9/19/18.
//  Copyright © 2018 SEC2018. All rights reserved.
//

import UIKit

class SECMainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example
        let manager: EventManager = SECEventManager(networkManager: SECNetworkManager())
        manager.getEvents { (events) in
            events?.forEach({ (event) in
                print("\(event)")
            })
        }
        
        // TODO: implement your ideas!
    }
}

