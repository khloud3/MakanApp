//
//  PlaceDetailView.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    @EnvironmentObject private var vm :PlaceViewModel
    let place : Place
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                    VStack(spacing:0){
                        imageSection
                            .shadow(color: Color.black .opacity(0.3), radius: 20,x: 0,y: 10)
                        titleSection
                    }.padding()
                }
                VStack(alignment: .leading, spacing: 16){
                    descriptionSection
                    Divider()
                    mapLayer
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        
        .background(.ultraThinMaterial)
        .overlay(backButton ,alignment: .topLeading)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: PlacesDataSerivces.places.first!)
            .environmentObject(PlaceViewModel())
    }
}

extension PlaceDetailView{
    private var imageSection :some View{
        TabView{
            
            ForEach(place.imageNames , id:\.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 400)
                    .clipped()
                
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    
    private var titleSection : some View{
        VStack(alignment: .trailing, spacing: 8){
            Text(place.name)
                .font(.title)
                .fontWeight(.bold)
            HStack{
                
                Text(place.cityName)
                    .font(.title3)
                    .foregroundColor(.secondary)
                Image("pin")
                    .resizable()
                    .frame(width: 18 , height: 20)
                    .opacity(0.5)
            }
        }.padding(.leading, 100)
    }
    
    private var descriptionSection : some View{
        VStack(alignment: .center, spacing: 8){
            Text(place.description)
                .font(.headline)
                .foregroundColor(Color("Color2"))
            
            if let url = URL(string: place.link){
                Link("الموقع على الخريطه" , destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayer : some View{
        
        Map(coordinateRegion:.constant(MKCoordinateRegion(
            center: place.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [place]){ location in
            MapAnnotation (coordinate: location.coordinates) {
                PlaceMapAnnotation()
                    .shadow(radius: 10)
            }
        }
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    private var backButton : some View{
        Button{
            vm.sheetLocation = nil
        }label: {
            Image(systemName: "xmark")
                .font(.subheadline)
                .padding(10)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                
                .padding()
        }
    }
    
}
