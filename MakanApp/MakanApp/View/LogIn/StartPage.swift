//
//  StartPage.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//

import SwiftUI

struct StartPage: View {
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack (spacing: 20){
                NavigationLink(destination: TabBar()){
                    Image("Applogo")
                        .resizable()
                        .frame(width: 300,height: 280)
                }
                ZStack{
                    
                    Button(action:{
                        showSheet1.toggle()
                    }, label: {
                        
                        Text("تسجيل الدخول")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding(20)
                            .frame(width: 250 , height: 55)
                            .background(Color("Color4"))
                            .cornerRadius(10)
                        
                    })
                    .sheet(isPresented: $showSheet1, content: {
                        SignIn()
                            
                    })
                }
                
                ZStack{
                    
                    Button(action:{
                        showSheet2.toggle()
                    }, label:{
                        Text("جديد ؟ انضم لنا")
                            .font(.headline)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(Color("Color3"),lineWidth: 2)
                                    .frame(width: 250 , height: 55)
                            )
                        
                    })
                    
                    .sheet(isPresented: $showSheet2, content: {
                        SignUp()
                    })
                }
            }
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
            .environmentObject(OTPViewModel())
            .environmentObject(PlaceViewModel())
    }
}
