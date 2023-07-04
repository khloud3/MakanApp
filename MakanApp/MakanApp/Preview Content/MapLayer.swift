//
//  MapLayer.swift
//  MakanApp
//
//  Created by khloud on 03/12/1444 AH.
//

import SwiftUI
import MapKit

struct MapLayer: View {
    @EnvironmentObject private var vm: PlaceViewModel
    var body: some View {
        VStack{
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.places,
                annotationContent: {location in
                MapAnnotation(coordinate: location.coordinates){
                    PlaceMapAnnotation()
                        .scaleEffect(vm.mapLocation == location ? 1 :0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                    
                }
                
                
            })
        }
        .ignoresSafeArea()
    }
}
struct MapLayer_Previews: PreviewProvider {
    static var previews: some View {
        MapLayer()
    }
}
