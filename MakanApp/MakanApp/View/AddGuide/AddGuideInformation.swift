//
//  AddGuideInformation.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//
import SwiftUI

struct AddGuideInformation: View {

    var body: some View {
        NavigationStack{
            ZStack{
                Color ("Color4")
                    .ignoresSafeArea()
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(height: 900)
                            .foregroundColor(.white)
                            .padding(.top )
                        
                        VStack {
                            
                            
                            ComponentView()
                            
                        }
                       
                        
                    }
                }
            }.navigationTitle(" رفيق الرحلة")
            
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct AddGuideInformation_Previews: PreviewProvider {
    static var previews: some View {
        AddGuideInformation()
    }
}




struct ComponentView: View {
    
    @ObservedObject var vm = AddGuideViewModel()
    @State var city = ["الرياض", "جدة", "أبها", "حايل","جازان", "مكة","الطائف","العلا"]
    @State var selectedCity = ""
    @State var guideNameTextField: String = ""
    @State var guideNumberTextField: String = ""
    @State var guideServiceTextField: String = ""
    
    var body: some View {
        VStack (spacing: 80){
            Text(" سجل بياناتك ،انضم لنا لمساعدة زوار مدينتك على اكتشاف اماكن جديدة يافزعة *")
                .foregroundColor(Color("Color2"))
            VStack(alignment:.leading ,spacing: 25){
                Text("الاسم")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color2"))
                ZStack{
                    TextField("ادخل اسمك", text: $guideNameTextField)
                        .keyboardType(.default)
                        .padding(.leading )
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Color2"), lineWidth: 2)
                        .frame(width: 355,height: 55)
                        
                    
                        

                }
                Text("رقم الجوال")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color2"))
                ZStack{
                    
                    TextField("ادخل رقم الجوال", text: $guideNumberTextField)
                        .keyboardType(.numberPad)
                        .padding(.all)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Color2"), lineWidth: 2)
                        .frame(width: 355,height: 55)
                }
                
                Text("الخدمات المقدمة")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color2"))
                ZStack{
                    
                    TextField("ادخل خدماتك", text: $guideServiceTextField )
                        .keyboardType(.default)
                        .padding(.all)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Color2"), lineWidth: 2)
                        .frame(width: 355,height: 100)
                }
                
                HStack{
                    Text("المدينة")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Color2"))
                    Spacer()
                    Picker(selection: $selectedCity , label: Text("Days")){
                        ForEach(city , id:\.self){
                            Text($0)
                        }
                    }
                }
            }
            Button{
                vm.createGuide(name: guideNameTextField, phoneNumber: guideNumberTextField, guideService: guideServiceTextField, city: selectedCity)
                 selectedCity = ""
                 guideNameTextField = ""
                 guideNumberTextField = ""
                 guideServiceTextField = ""
                
            } label: {
                
                Text("انضم لنا")
                    .foregroundColor(Color("Color2"))
                    .frame(height: 20)
                    .font(.system(size: 20))
                    .font(.headline)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("Color3"))
                    .cornerRadius(10)
                
                
            }
        }.padding()
    }
}
