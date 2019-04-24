//
//  CycleAnnotationView.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import MapKit

private let multiWheelCycleClusterID = "multiWheelCycle"

/// - Tag: BicycleAnnotationView
class ChargingSpotAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "chargingSpotAnnotation"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = multiWheelCycleClusterID
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// - Tag: DisplayConfiguration
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
        glyphImage = #imageLiteral(resourceName: "charging-points")
    }
}

class ParkingSpotAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "parkingSpotAnnotation"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = multiWheelCycleClusterID
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .required
        glyphImage = #imageLiteral(resourceName: "parking-points")
    }
}
