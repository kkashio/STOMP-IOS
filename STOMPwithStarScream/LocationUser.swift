//
//  LocationMessage.swift
//  STOMPwithStarScream
//
//  Created by Je.vinci.Inc on 2017. 7. 21..
//  Copyright © 2017년 Je.vinci.Inc. All rights reserved.
//

import Foundation
import ObjectMapper

struct LocationUser : Mappable{
    var seq:Int?
    var userId:Int?
    var longitude:Double?
    var latitude:Double?
    var time:Date?
    var speed:Double?
    var course:Double?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        seq <- map["seq"]
        userId <- map["userId"]
        longitude <- map["longitude"]
        latitude <- map["latitude"]
    }
    init(){
    }
}
