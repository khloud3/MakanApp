//
//  PlacesViewModel.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//
import Foundation
import MapKit
import SwiftUI

class PlaceViewModel :ObservableObject{
    

    @Published var places :[Place]
    

    @Published var mapLocation : Place{
        didSet{
            updatMapRegion(location: mapLocation)
        }
    }
   
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    

    @Published var showLocationList : Bool = false
    

    @Published var sheetLocation : Place? = nil
    
    init(){
        let places = PlacesDataSerivces.places
        self .places = places
        self .mapLocation = places.first!
        self .updatMapRegion(location: places.first!)
    }
    private func updatMapRegion (location :Place){
        withAnimation(.easeOut){
            mapRegion = MKCoordinateRegion(
            center: location.coordinates,
             span: mapSpan)
        }
    }
     func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    func showNextLocation(location : Place){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
}
