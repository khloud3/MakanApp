//
//  ContentView.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_status = false
    var body: some View {
        NavigationView {
            if log_status{
                PlaceView()
            }else{
              SignIn()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
