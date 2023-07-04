//
//  CurrentLocationViewModel.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import Foundation
import SwiftUI
import CoreLocationUI
import MapKit

class CurrentLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.8859420, longitude: 45.0791620), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestAllowOnceLocationPermission(){
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            return
        }
        
        DispatchQueue.main.async {
            self.mapRegion = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
