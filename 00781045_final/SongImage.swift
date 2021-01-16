//
//  SongImage.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct SongImage: View  {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    
    func downLoad() {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            image = Image(uiImage: uiImage)
            downloadImageOk = true
        }
    }
    var body: some View {
        image
            .resizable()
            .onAppear {
                if downloadImageOk == false {
                    downLoad()
                }
            }
    }
    
}

struct SongImage_Previews: PreviewProvider {
    static var previews: some View {
        SongImage(url: URL(string: "https://wakelandtheatre.files.wordpress.com/2013/11/final-poster.jpg")!)
    }
}
