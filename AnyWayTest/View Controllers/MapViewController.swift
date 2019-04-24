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
        print("tıklandım")
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isMember(of: MKUserLocation.self) {
            return nil
        }
        
        let reuseId = "test"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if anView == nil {
            anView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.animatesDrop = false
            anView!.canShowCallout = false
            anView!.pinTintColor = .clear
            let imageView = UIImageView(frame: CGRect.zero)
            imageView.tag = 99
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            anView!.addSubview(imageView)
        }
        else {
            anView!.animatesDrop = false
            anView!.canShowCallout = false
            anView!.pinTintColor = .clear
            anView?.annotation = annotation
        }
        
        
        if let imageView = anView!.viewWithTag(99) as? UIImageView{
            if segmentControl.selectedSegmentIndex == 0{
                imageView.image = #imageLiteral(resourceName: "parking-points")
            }else{
                imageView.image = #imageLiteral(resourceName: "charging-points")
            }
        }
        
        
        return anView
    }
}
