//
//  photos.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI

struct photos: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State private var showWebpage = false
    
    var body: some View{
        VStack{
           
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            HStack{
                Button(action: {
                    self.isShowPhotoLibrary = true
                }){
                    HStack{
                        Image(systemName: "photo")
                            .font(.system(size: 15))
                        Text("Choose your photo")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isShowPhotoLibrary){
                ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            }
        }
    }
}
