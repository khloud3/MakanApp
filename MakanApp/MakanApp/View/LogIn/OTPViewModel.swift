//
//  OTPViewModel.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class OTPViewModel: ObservableObject{
    
    @Published var number: String = ""
    @Published var code: String = "+966"
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    @Published var verificationCode: String = ""
    @Published var isLoading: Bool = false
    
    @Published var navigationTag: String?
    
    @AppStorage("log_status")var log_status = false
    
    func sendOTP()async{
        if isLoading {return}
        do{
            otpText = otpFields.reduce(""){
                PartialResult,value in
                PartialResult + value
            }
            isLoading = true
            let result = try await
            PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        }catch{
            handleError(error: error.localizedDescription)
        
    }
}

    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
    func verifyOTP() async{
        do{
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let _ = try await Auth.auth().signIn(with: credential)
            DispatchQueue.main.async { [self] in
                isLoading = false
                log_status = true
            }
        }catch{
            handleError(error: error.localizedDescription)
        }
       
            
        }
    }


