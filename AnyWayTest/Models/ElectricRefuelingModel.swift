//
//  ElectricRefuelingModel.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class ElectricRefuelingResponseModel:Decodable{
    var result:ElectricRefuelingChargingPointModel
}

class ElectricRefuelingChargingPointModel:Decodable{
    var chargepoint:[ElectricRefuelingModel]
}

class ElectricRefuelingModel:NSObject, Decodable, MKAnnotation{
    
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
    
    
    func getLocation() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        set {
            // For most uses, `coordinate` can be a standard property declaration without the customized getter and setter shown here.
            // The custom getter and setter are needed in this case because of how it loads data from the `Decodable` protocol.
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
}
