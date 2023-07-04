//
//  PlaceCardView.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI

struct PlaceCardView: View {
    @EnvironmentObject private var vm: PlaceViewModel
    let place: Place
    
    var body: some View {
        HStack(alignment: .bottom ,spacing: 40){
           
                imageSection
                
                
            
            VStack (spacing:8){
                titleSection
                learnMoreButton

            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(place: PlacesDataSerivces.places.first!)
    }
}

extension PlaceCardView{
    private var imageSection : some View{
        ZStack{
            if let imageName = place.imageNames.first{
                Image(imageName)
                    .resizable ()
                    .scaledToFit()
                    .frame (width: 100, height: 130)
                    .cornerRadius (10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(spacing: 2){
            
            Text(place.name)
                .font(.title3)
                .bold()
            
            Text(place.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity )
        
    }
    private var learnMoreButton : some View{
        
        Button{
            vm.sheetLocation = place
            
        } label: {
            Text("اعرف اكثر")
                .foregroundColor(Color("Color2"))
                .frame(width: 150, height: 2)
                .font(.headline)
                .padding(.vertical)
                .background(Color("Color3"))
                .cornerRadius(10)
        }
        
        
    }
 
}
