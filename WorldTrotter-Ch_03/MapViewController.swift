//
//  MapViewController.swift
//  WorldTrotter-Ch_03
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    var mapView: MKMapView!
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as *the* view of the view controller
        view = mapView
        
        // let's programmatically create a segmented control for the map interface
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        // hook up the segmented button to the map
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged) // note we are referencing the below function via a String of its name; WTF?!?!
        
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false // some legacy thing we always need to do
        view.addSubview(segmentedControl)
        
        // let's add some AUTOLAYOUT constraints to our segmented view
        // pin the top anchor to the top layout guide of the superView, with an offset of 8
        // pin the leading anchor to the margin.leading anchor
        
        let margins = view.layoutMarginsGuide
        let topConstraint =  segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }

    
}
