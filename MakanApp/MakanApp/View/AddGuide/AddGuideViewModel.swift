//
//  FireStoreViewModel.swift
//  MakanApp
//
//  Created by khloud on 01/12/1444 AH.
//


import SwiftUI
import FirebaseCore
import FirebaseFirestore



class AddGuideViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    
    func createGuide(name: String, phoneNumber: String, guideService:String, city: String){
        
        
        let guideInfo: [String: Any] = [
            "name": name,
            "phoneNumber": phoneNumber,
            "guideService": guideService,
            "city": city,
            "orderID": UUID().uuidString
        ]
        
        var ref: DocumentReference? = nil
        ref = db.collection("guides")
            .addDocument(data: guideInfo) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Order has been added with ID: \(ref!.documentID)")
                }
            }
    }
}
