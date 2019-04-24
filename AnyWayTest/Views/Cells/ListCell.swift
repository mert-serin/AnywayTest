//
//  ListCell.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeImageView: UIImageView!
    
    var listModel: Decodable?{
        didSet{
            if let parkingSpot = listModel as? ParkingSpotsModel{
                nameLabel.text = parkingSpot.name
                typeImageView.image = #imageLiteral(resourceName: "parking-points")
            }
            
            if let chargingSpot = listModel as? ElectricRefuelingModel{
                nameLabel.text = chargingSpot.name
                typeImageView.image = #imageLiteral(resourceName: "charging-points")
            }
        }
    }
    
    override func prepareForReuse() {
        typeImageView.image = nil
    }
}
