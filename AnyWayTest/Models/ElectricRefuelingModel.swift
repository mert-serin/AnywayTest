//
//  ElectricRefuelingModel.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation

class ElectricRefuelingResponseModel:Decodable{
    var result:ElectricRefuelingChargingPointModel
}

class ElectricRefuelingChargingPointModel:Decodable{
    var chargepoint:[ElectricRefuelingModel]
}

class ElectricRefuelingModel:Decodable{
    
    enum CodingKeys: String, CodingKey {
        case parkingID = "ParkingID"
        case latitude = "Lat"
        case longitude = "Lng"
        case name = "ParkingName"
    }
    
    var parkingID:Int
    var latitude:Double
    var longitude:Double
    var name:String
    
    
    
}
