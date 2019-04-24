//
//  MapContoller.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import Foundation

class MapController{
    
    
    func getElectricRefuelingSpots() -> [ElectricRefuelingModel]?{
        if let url = Bundle.main.url(forResource: "electric-refueling", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([ElectricRefuelingModel].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
    
}
