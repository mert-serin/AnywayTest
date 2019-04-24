//
//  ElectricRefuelingModel.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation
class ElectricRefuelingModel:Decodable{
    
    enum CodingKeys: String, CodingKey {
        case globalID = "global_id"
        case ID
        case latitude = "Latitude_WGS84"
        case longitude = "Longitude_WGS84"
        case name
    }
    
    var globalID:Int
    var ID:Int
    var latitude:String
    var longitude:String
    var name:String
    
    
    
}
