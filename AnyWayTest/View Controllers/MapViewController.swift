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
        
        registerAnnotationViewClasses()
    }
    
    private func registerAnnotationViewClasses() {
        mapView.register(ParkingSpotAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(ChargingSpotAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
    }
    
    
    @IBAction func onSegmentContolChanged(_ sender: UISegmentedControl) {
        mapView.removeAnnotations(mapView.annotations)
        
        if sender.selectedSegmentIndex == 0{
            if let parkingSpots = mapController.getParkingSpots(){
                mapView.addAnnotations(parkingSpots)
            }
        }else{
            if let chargingSpots = mapController.getElectricRefuelingSpots(){
                mapView.addAnnotations(chargingSpots)
            }
        }
    }

}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let parkingSpot = annotation as? ParkingSpotsModel{
            return ParkingSpotAnnotationView(annotation: annotation, reuseIdentifier: ParkingSpotAnnotationView.ReuseID)
        }
        if let chargingSpot = annotation as? ElectricRefuelingModel{
            return ChargingSpotAnnotationView(annotation: annotation, reuseIdentifier: ChargingSpotAnnotationView.ReuseID)
        }
        
        return nil
    }
}
