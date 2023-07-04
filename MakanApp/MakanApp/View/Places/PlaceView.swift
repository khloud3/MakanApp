//
//  PlaceView.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct PlaceView: View {
    
    @EnvironmentObject private var vm: PlaceViewModel
    @StateObject private var currentVM = CurrentLocationViewModel()
    
    var body: some View {
        ZStack{
            
            MapLayer()
            
            
            VStack(spacing: -70){
                Bar()
                
                LocationButton(.currentLocation){
                    currentVM.requestAllowOnceLocationPermission()
                }
                .foregroundColor(.white)
                .cornerRadius(50)
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
                .tint(Color("Color2"))
                .padding(.leading ,300)
                CardPlaces()
                
            }
        }
        .sheet(item: $vm.sheetLocation,onDismiss: nil ) { location in
            PlaceDetailView(place: location)
            
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
            .environmentObject(PlaceViewModel())
    }
}






