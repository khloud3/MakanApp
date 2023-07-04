//
//  Bar.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI

struct Bar: View {
    @StateObject var vm = PlaceViewModel()
    @State var menu = 0
    
    var body: some View {
        ZStack{
            
            HStack{
                
                Button (action: {
                    
                    self.menu = 0
                })  {
                    Text("الجميع")
                        .font(.system(size: 13))
                        .foregroundColor(self.menu == 0 ? .white: Color("Color2"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(self.menu == 0 ? Color("Color4") : Color("Color3") .opacity(0.6))
                .clipShape(Capsule())
                
                Button (action: {
                    self.menu = 1
                    
                })  {
                    Text("مطاعم")
                        .font(.system(size: 13))
                        .foregroundColor(self.menu == 1 ? .white: Color("Color2"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(self.menu == 1 ? Color("Color4") : Color.white .opacity(0.6))
                .clipShape(Capsule())
            
                
                
                Button (action: {
                    
                    self.menu = 2
                    
                })  {
                    Text("قهوة")
                        .font(.system(size: 13))
                        .foregroundColor(self.menu == 2 ? .white: Color("Color2"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(self.menu == 2 ? Color("Color4") : Color.white .opacity(0.6))
                .clipShape(Capsule())
                
                Button (action: {
                    self.menu = 3
                })  {
                    Text("انشطة ترفيهية")
                        .font(.system(size: 13))
                        .foregroundColor(self.menu == 3 ? .white: Color("Color2"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(self.menu == 3 ? Color("Color4"): Color.white .opacity(0.6))
                .clipShape(Capsule())
            }.padding(.bottom ,520)
                Spacer()

            
        }
    }
//    if (vm.places)
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar()
    }
}


