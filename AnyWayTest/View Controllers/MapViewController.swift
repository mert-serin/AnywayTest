//
//  MapViewController.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var mapView: MKMapView!
    
    private var mapController = MapController()
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.region = MKCoordinateRegion(center: MapManager.moscowCenter, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    @IBAction func onSegmentContolChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }

}
