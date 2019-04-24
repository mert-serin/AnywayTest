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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.centerCoordinate = MapManager.moscowCenter
    }
    
    @IBAction func onSegmentContolChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }

}
