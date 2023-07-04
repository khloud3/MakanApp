//
//  SignUp.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                VStack( spacing:-10){
                    
                    
                        
                        Text("الاسم")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 22))
                            .padding(.leading, -150)
                    
                    
                    ZStack{
                        TextField(" ادخل اسمك", text: $name)
                            .padding(.leading )
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Color2"), lineWidth: 2)
                            .opacity(0.5)
                            .frame(width: 355,height: 55)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    .padding()
                }
                VStack( spacing:-10){
                   
                        
                
                        
                        
                        Text("رقم الجوال")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 22))
                            .padding(.leading, -160)
                   
                    
                    ZStack{
                        TextField("ادخل رقمك", text: $phoneNumber)
                            .padding(.leading )
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Color2"), lineWidth: 2)
                            .opacity(0.5)
                            .frame(width: 355,height: 55)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    .padding()
                }
                
                NavigationLink( destination: TabBar()){
                    Button{
                        
                    }label: {
                        
                        Text("تسجيل")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color3"))
                            .cornerRadius(10)
                        
                        
                    }
                }
            }.padding()
                .navigationTitle("إنشاء حساب")
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(OTPViewModel())
    }
}
