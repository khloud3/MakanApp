//
//  TapBar.swift
//  MakanApp
//
//  Created by khloud on 03/12/1444 AH.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        
        TabView{
            
            PlaceView()
                .tabItem{
                    Label("", systemImage: "map.fill" )
                }
            AddNewPlace()
                .tabItem{
                    Label("", systemImage: "plus.rectangle.fill.on.rectangle.fill" )
                }
            ChooseGuide()
                .tabItem{
                    Label("", systemImage: "person.line.dotted.person.fill" )
                }
            
        }
        
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(PlaceViewModel())
    }
}
