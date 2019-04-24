//
//  ParkingSpotsModel.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

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

class ParkingSpotsModel:NSObject, Decodable, MKAnnotation{
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case parkingAccess = "ParkingAccess"
    }
    
    var name:String
    var parkingAccess:ParkingSpotsParkingAccessModel
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: parkingAccess.access.latitude, longitude: parkingAccess.access.longitude)
        }
        set {
            // For most uses, `coordinate` can be a standard property declaration without the customized getter and setter shown here.
            // The custom getter and setter are needed in this case because of how it loads data from the `Decodable` protocol.
            parkingAccess.access.latitude = newValue.latitude
            parkingAccess.access.longitude = newValue.longitude
        }
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
