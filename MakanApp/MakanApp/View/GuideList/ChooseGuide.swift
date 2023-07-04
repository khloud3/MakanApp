//
//  ChooseGuied.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//

import SwiftUI

struct ChooseGuide: View {
    
    @ObservedObject var vm = GuideListViewModel()
    @State var selectedGuide: GuideListModel?
    @State var value: GuideListModel?
    
    var body: some View {
        
        NavigationStack{
            
               
                        VStack (alignment: .center ){
                            ZStack{
                                Color("Color1")
                                    .opacity(0.2)
                            if vm.guides.count == 0 {
                                ProgressView()
                                Text("لايوجد مرشدين")
                                
                            }else{
                                
                                ScrollView {
                                    
                                    ForEach(vm.guides){ guide in
                                        
                                            VStack{
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(.white)
                                                        .frame(width: 340, height: 100)
                                                        .shadow(color: Color.gray .opacity(0.3), radius: 5,x: 0,y: 10)

                                                    
                                                    VStack(spacing: 0){
                                                        
                                                        
                                                        HStack{
                                                            
                                                            Image("Plogo")
                                                                .resizable()
                                                                .frame(width: 22 , height: 22)
                                                            Text(guide.name)
                                                                .font(.title2)
                                                            Spacer()
                                                            
                                                        }.padding()
                                                        
                                                        
                                                        HStack( spacing:200){
                                                            HStack{
                                                                
                                                                Image("pin")
                                                                    .resizable()
                                                                    .frame(width: 12 , height: 14)
                                                                    .opacity(0.5)
                                                                Text(guide.city)
                                                            }
                                                            Button{
                                                                value = guide
                                                            }label: {
                                                                Image(systemName: "eject")
                                                                    .resizable()
                                                                    .frame(width: 22 , height: 22)
                                                                    .foregroundColor(Color("Color3"))
                                                                
                                                                
                                                            }
                                                        }.sheet(item: $value) { guide in
                                                            GuideListInfo(a: guide)
                                                            
                                                        }
                                                        
                                                    }.padding()
                                                }
                                            }
                                        }
                                }
                                }
                            }
                            
                            NavigationLink(destination: AddGuideInformation()){
                               
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 50 ,height: 50)
                                        .foregroundColor(Color("Color4"))
                                        .padding(.leading , 200)
                                
                                
                            }
                        }.navigationTitle("مرشد سياحي")
                        .padding()
                        .toolbarBackground(
                            Color("Color4")
                            
                        )
                    
         
                        
            
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}


struct ChooseGuide_Previews: PreviewProvider {
    static var previews: some View {
        
            ChooseGuide()
        
    }
}

