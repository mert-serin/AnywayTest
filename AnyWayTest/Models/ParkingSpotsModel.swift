//
//  ParkingSpotsModel.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation
import CoreLocation

class ParkingSpotsResponseModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case parkingList = "ParkingList"
    }
    
    var parkingList:ParkingSpotsListModel
}

class ParkingSpotsListModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case parking = "Parking"
    }
    
    var parking:[ParkingSpotsModel]
}

class ParkingSpotsModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case parkingAccess = "ParkingAccess"
    }
    
    var name:String
    var parkingAccess:ParkingSpotsParkingAccessModel
    
    func getLocation() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: parkingAccess.access.latitude, longitude: parkingAccess.access.longitude)
    }
}

class ParkingSpotsParkingAccessModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case access = "Access"
    }
    var access:ParkingSpotsAccessModel
}

class ParkingSpotsAccessModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
    var latitude:Double
    var longitude:Double
}
