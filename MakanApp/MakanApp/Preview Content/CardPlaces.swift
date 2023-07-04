//
//  CardPlaces.swift
//  MakanApp
//
//  Created by khloud on 03/12/1444 AH.
//

import SwiftUI

struct CardPlaces: View {
    @EnvironmentObject private var vm: PlaceViewModel
    var body: some View {
        ZStack{
            ForEach(vm.places){ location in
                if vm.mapLocation == location{
                    PlaceCardView(place: location)
                        .shadow(color: Color.black .opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion:.move(edge:.trailing),
                            removal: .move(edge:.leading)))
                }
            }
        }
    }
}

struct CardPlaces_Previews: PreviewProvider {
    static var previews: some View {
        CardPlaces()
            .environmentObject(PlaceViewModel())
    }
}
