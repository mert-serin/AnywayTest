//
//  MapContoller.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation

class MapController{
    
    var refuelingSpots:[ElectricRefuelingModel]?
    var parkingSpots:[ParkingSpotsModel]?
    
    func getElectricRefuelingSpots() -> [ElectricRefuelingModel]?{
        if let url = Bundle.main.url(forResource: "electric-refueling", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ElectricRefuelingResponseModel.self, from: data)
                if refuelingSpots == nil{
                    self.refuelingSpots = jsonData.result.chargepoint
                }
                return refuelingSpots
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
    func getParkingSpots() -> [ParkingSpotsModel]?{
        if let url = Bundle.main.url(forResource: "parking-spots-barcelona", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ParkingSpotsResponseModel.self, from: data)
                if parkingSpots == nil{
                    self.parkingSpots = jsonData.parkingList.parking
                }
                return parkingSpots
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
}
