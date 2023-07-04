//
//  PlacesDataSerivces.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import Foundation
import MapKit

class PlacesDataSerivces {
    
    static let places: [Place] = [
        Place(
        name: "رشفة قصور ابو سراح",
        cityName: "أبها",
        coordinates: CLLocationCoordinate2D(latitude: 18.2206189, longitude: 42.4276536),
        description: "مقهى رشفة في قصور ابو سراح الاثرية -ابها - السودة",
        imageNames: [
            "rsh1",
            "rsh2",
            "rsh3",
        ], placeType: "قهوة",
        link: "https://maps.apple.com/?address=62518,%20Asir%20Principality,%20Saudi%20Arabia&auid=3504941052321558882&ll=18.220705,42.428413&lsp=9902&q=%D9%82%D8%B5%D9%88%D8%B1%20%D8%A2%D9%84%20%D8%A3%D8%A8%D9%88%20%D8%B3%D8%B1%D8%A7%D8%AD&t=m"),
        Place(
            name: "تلة آل مشيبة",
            cityName: "أبها",
            coordinates: CLLocationCoordinate2D(latitude: 18.2187000, longitude: 42.4331130),
            description: "أبها - العزيزة - السودة",
            imageNames: [
                "al1",
                "al2",
                "al3",
            ], placeType: "Activity",
            link: "https://maps.app.goo.gl/EY14JfwP2Gz3tCQz9?g_st=ic"),
           
            Place(
            name: "شلال عين الذيبه",
            cityName: "أبها",
            coordinates: CLLocationCoordinate2D(latitude: 18.28173, longitude: 42.39467),
            description: "شلال عين الذيبة في ابها - السودة",
            imageNames: [
                "d1",
                "d2",
                "d3",
            ], placeType: "Activity",
            link: "https://maps.apple.com/?address=Ain%20Al%20Theibah,%20Asir%20Principality%2062535,%20Saudi%20Arabia&auid=15661217278584433139&ll=18.281727,42.394669&lsp=9902&q=Eye%20Alvebh&t=m"),
           
           
    ]
    
}
