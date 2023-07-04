//
//  PlacesModel.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import Foundation
import MapKit

struct Place : Identifiable ,Equatable{
   let id = UUID()
    let name :String
    let cityName :String
    let coordinates : CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    var placeType: String
    let link: String
    
}

struct PlaceType {
    
}


 func == (lhs:Place , rhs :Place) ->  Bool {
    lhs.id == rhs.id
}
