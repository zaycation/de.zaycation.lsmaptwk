//
//  MapView.swift
//  lsmaaptwk
//
//  Created by Isaiah Thomas on 02/24/2020
//  Copyright © 2020 zaycation. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
    func setupManager() {
        
        locationManager.desiredAccuracy =
        kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        
        setupManager()
        let MapView = MKMapView(frame: UIScreen.main.bounds)
        MapView.showsUserLocation = true
        MapView.userTrackingMode = .follow
        return MapView
        
        
    }
    
    
    
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.78736877441406, longitude: -122.40823364257812)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
