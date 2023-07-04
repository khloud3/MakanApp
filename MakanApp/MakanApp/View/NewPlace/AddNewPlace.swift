//
//  AddNewPlace.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI



struct AddNewPlace: View {
    
    @State var placeType = ["مطعم", "كوفي", "انشطه ترفيهية"," آخرى"]
    @State var selectedPlace = ""
    @State var placeNameTextField: String = ""
    @State var placeDescriptionTextField: String = ""
    @State var locationTextField: String = ""
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color ("Color4")
                    .ignoresSafeArea()
                ScrollView{
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .frame(height: 1000)
                                .foregroundColor(.white)
                            
                            VStack(alignment: .center, spacing: 50) {
                                Text("شاركنا اماكن زرتها تنصح فيها ورينا اكتشافك*")
                                    .foregroundColor(Color("Color2"))
                                VStack (alignment: .listRowSeparatorLeading, spacing: 20){
                                    Text("اسم المكان")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color("Color2"))
                                    ZStack{
                                        TextField("ادخل اسم المكان", text: $placeNameTextField)
                                            .keyboardType(.numberPad)
                                            .padding(.leading )
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color("Color2"), lineWidth: 2)
                                            .frame(width: 355,height: 55)
                                    }
                                        Text("وصف المكان")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color("Color2"))
                                        ZStack{
                                            
                                            TextField("ادخل وصف للمكان", text: $placeDescriptionTextField)
                                                .keyboardType(.numberPad)
                                                .padding(.all)
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color("Color2"), lineWidth: 2)
                                                .frame(width: 355,height: 100)
                                        }
                          
                                    
                                }.padding()
               
                                VStack (){
                                    Text("أضف صورة")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color("Color2"))
                                    ZStack{
                                        PickImage()
                                       
                                    }
                                    
                                        Picker("",selection: $selectedPlace){
                                            ForEach(placeType , id:\.self){
                                                Text($0)
                                            }
                                            
                                        }
                                        .pickerStyle(.segmented)
                                        
                                }.padding()
                                
                                Button(action:{
                                    
                                }, label: {
                                    
                                    Text("إضافة")
                                        .foregroundColor(Color("Color2"))
                                        .frame(height: 20)
                                        .font(.system(size: 20))
                                        .font(.headline)
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(Color("Color3"))
                                        .cornerRadius(10)
                                    
                                    
                                }).padding()
                            }
                            
                        }
                        .navigationTitle("إضافة مكان جديد")
                    }
                }
            }
                
        }
        
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct AddNewPlace_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPlace()
    }
}
