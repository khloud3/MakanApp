//
//  GuideListViewModel.swift
//  MakanApp
//
//  Created by khloud on 02/12/1444 AH.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class GuideListViewModel: ObservableObject {
    
    @Published var guides: [GuideListModel] = []
    
    init() {
        getAllGuides()
    }
    
   
    func getAllGuides() {
        
        let db = Firestore.firestore()
        
        db.collection("guides")
            .getDocuments() { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                var newGuide: [GuideListModel] = []
                
                for document in documents {
                    let data = document.data()

                  
                    if let name = data["name"] as? String,
                       let phoneNumber = data["phoneNumber"] as? String,
                       let guideService = data["guideService"] as? String,
                       let city = data["city"] as? String,
                       let orderID = data["orderID"] as? String{

                       
                        let guide = GuideListModel(name: name, phoneNumber: phoneNumber, guideService: guideService, city: city, orderID: orderID)
     
                        newGuide.append(guide)
                    }
                }
                
                DispatchQueue.main.async {
                    self?.guides.append(contentsOf: newGuide)
                }
            }
        }
    }
}
