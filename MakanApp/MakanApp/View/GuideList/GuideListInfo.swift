//
//  GuideListInfo.swift
//  MakanApp
//
//  Created by khloud on 02/12/1444 AH.
//

import SwiftUI
import Firebase

struct GuideListInfo: View {
   
    var a : GuideListModel
    
    var body: some View {
      
            ZStack{
                Color("Color1")
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(height: 250)
                        VStack(spacing: 30){
                            VStack{
                                Text(a.name)
                                    .font(.title2)
                                HStack{
                                   
                                    Text(a.city)
                                        .opacity(0.5)
                                    
                                    Image("pin")
                                        .resizable()
                                        .frame(width: 12 , height: 14)
                                        .opacity(0.5)
                                   
                                }
                               
                            }.padding(.leading , 190)
                            Divider()
                                .frame(width: 300)
                                .padding(.top , -20)
                            VStack(spacing: 30){
                                HStack{
                                    
                                    Text(a.guideService)
                                        .font(.title2)
                                    Image(systemName: "text.justify.leading")
                                        .resizable()
                                        .foregroundColor(Color("Color3"))
                                        .frame(width: 20 , height: 20)
                                }
                                HStack{
                                    
                                    Text(a.phoneNumber)
                                    Text("تواصل معي : ")
                                        .opacity(0.5)
                                }
                            }.padding(.leading , 50)
                          
                        }
                    }.padding()
                }
        }
    }
}


