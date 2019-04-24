//
//  ClusterAnnotationView.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import MapKit

/// - Tag: ClusterAnnotationView
class ClusterAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        collisionMode = .circle
        centerOffset = CGPoint(x: 0, y: -10) // Offset center point to animate better with marker annotations
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// - Tag: CustomCluster
    override func prepareForDisplay() {
        super.prepareForDisplay()
        
        if let cluster = annotation as? MKClusterAnnotation {
            let whole = cluster.memberAnnotations.count
            let clusterColor = cluster.memberAnnotations.first is ElectricRefuelingModel ? UIColor.green : .white
            image = drawRatio(to: whole, cycleColor: clusterColor)
        }
            
    }
    
    private func drawRatio(to whole: Int, cycleColor:UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 80, height: 80))
        return renderer.image { _ in
            // Fill inner circle with white color
            cycleColor.setFill()
            UIBezierPath(ovalIn: CGRect(x: 16, y: 16, width: 48, height: 48)).fill()
            
            // Finally draw count text vertically and horizontally centered
            let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,
                               NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
            let text = "\(whole)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 40 - size.width / 2, y: 40 - size.height / 2, width: size.width, height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
    }
}
