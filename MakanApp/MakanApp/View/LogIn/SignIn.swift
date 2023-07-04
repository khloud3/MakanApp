//
//  SignIn.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//

import SwiftUI

struct SignIn: View {
    
    @StateObject var otpModel: OTPViewModel = .init()
    
    var body: some View {
        
        NavigationStack{
            
            VStack (alignment: .center , spacing:50){
                VStack(alignment: .listRowSeparatorLeading, spacing:-10){
                    
                        
                        Text("رقم الجوال")
                        
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 22))
                            .padding(.leading )
                    
                    ZStack(alignment:.center){
                        HStack(alignment: .lastTextBaseline, spacing:0){
                            
                            Text(otpModel.code)
                                .padding()
                            
                            TextField("ادخل رقمك", text: $otpModel.number)
                                .keyboardType(.numberPad)
                                .padding(.leading )
                            
                        }
                        .padding(.horizontal)
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Color2"), lineWidth: 2)
                            .opacity(0.5)
                            .frame(width: 355,height: 55)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    .padding()
                }
                VStack(alignment: .center){
                    Button{
                        Task{ await otpModel.sendOTP()}
                        
                    } label: {
                        
                        Text("المتابعة")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 20))
                            .font(.largeTitle)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color3"))
                            .cornerRadius(10)
                            
                            .overlay{
                                ProgressView()
                                    .opacity(otpModel.isLoading ? 1 :0)
                            }
                        
                    }
                }
                
                .disabled(otpModel.code == "" || otpModel.number == "")
                .opacity(otpModel.code == "" || otpModel.number == "" ? 0.4 : 1)
                
            }
            .padding()
            .frame( alignment: .top)
            .navigationTitle("تسجيل الدخول")
        }
        .environment(\.layoutDirection, .rightToLeft)
        .background{
        
            NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag){
                OTPView()
                    .environmentObject(otpModel)
            }label: {}
                .labelsHidden()
        }
        .alert(otpModel.errorMsg, isPresented:$otpModel.showAlert){}
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .environmentObject(OTPViewModel())
    }
}
