//
//  Communicator.swift
//  STOMPwithStarScream
//
//  Created by Je.vinci.Inc on 2017. 7. 21..
//  Copyright © 2017년 Je.vinci.Inc. All rights reserved.
//

import Foundation
protocol Deliverable {
    var delivery:LocationUser {get}
    var delegate: Audible? {get}
}
protocol Audible {
    func DoorBell(delivery: LocationUser)
}
