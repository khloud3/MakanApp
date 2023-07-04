//
//  PlaceMapAnnotation.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI

struct PlaceMapAnnotation: View {
    
    let accentColor = Color ("Color3")
    
    var body: some View {
        
        VStack (spacing: 0) {
            Image (systemName: "mappin.circle.fill")
                .resizable ()
                .scaledToFit ()
                .frame (width: 30, height: 30)
                .font (.headline)
                .foregroundColor(.white)
                .padding (6)
                .background (accentColor)
                .cornerRadius (36)
            
            Image (systemName: "triangle.fill")
                .resizable ( )
                .scaledToFit ()
                .foregroundColor (accentColor)
                .frame (width: 10, height: 10) .rotationEffect (Angle (degrees: 180))
                .offset (y: -3)
                .padding (.bottom, 40)
        }
    }
}

struct PlaceMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMapAnnotation()
    }
}
