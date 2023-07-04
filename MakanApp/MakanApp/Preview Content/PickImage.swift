//
//  PickImage.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//

import SwiftUI
import PhotosUI
import CoreTransferable


struct PickImage: View {
    @State var images: [UIImage] = []
    @State var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal){
                
            HStack{
                
                    ForEach(images, id:\.cgImage){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .frame(width: 200, height: 250)
                            
                    }
                }
            }
           
            PhotosPicker(selection: $selectedItems,
                         matching: .images) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40 ,height: 40)
                    .foregroundColor(Color("Color4"))
            }
                         .onChange(of: selectedItems) { selectedItems in
                             images = []
                             for item in selectedItems {
                                 item.loadTransferable(type: Data.self) { result in
                                     switch result {
                                     case .success(let imageData):
                                         if let imageData {
                                             self.images.append(UIImage(data: imageData)!)
                                         } else {
                                             print("No supported content type found.")
                                         }
                                     case .failure(let error):
                                         print(error)
                                     }
                                 }
                             }
                         }
        }.padding()
    }
}

struct PickImage_Previews: PreviewProvider {
    static var previews: some View {
        PickImage()
    }
}
