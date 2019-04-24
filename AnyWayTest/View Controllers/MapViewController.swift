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

    @IBOutlet private weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var mapView: MKMapView!
    
    private var mapController = MapController()
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.region = MKCoordinateRegion(center: MapManager.barcelonaCenter, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        onSegmentContolChanged(segmentControl)
    }
    
    
    @IBAction func onSegmentContolChanged(_ sender: UISegmentedControl) {
        mapView.removeAnnotations(mapView.annotations)
        
        if sender.selectedSegmentIndex == 0{
            if let parkingSpots = mapController.getParkingSpots(){
                let annotations = parkingSpots.map { (model) -> MKAnnotation in
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = model.getLocation()
                    return annotation
                }
                mapView.addAnnotations(annotations)
            }
        }else{
            if let chargingSpots = mapController.getElectricRefuelingSpots(){
                let annotations = chargingSpots.map { (model) -> MKAnnotation in
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = model.getLocation()
                    return annotation
                }
                mapView.addAnnotations(annotations)
            }
        }
    }

}

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return nil
    }
}
