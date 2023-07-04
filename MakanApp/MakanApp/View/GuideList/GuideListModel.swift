//
//  GuideListModel.swift
//  MakanApp
//
//  Created by khloud on 02/12/1444 AH.
//

import Foundation

struct GuideListModel: Identifiable{
    
    var id = UUID()
    var name: String
    var phoneNumber: String
    var guideService: String
    var city: String
    
    var orderID: String
}
