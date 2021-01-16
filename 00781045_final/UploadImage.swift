//
//  UploadImage.swift
//  00781045_final
//
//  Created by User09 on 2021/1/12.
//

import Foundation
import SwiftUI
import Alamofire

struct UploadImage: Decodable {
    let data: Data
    struct Data: Decodable {
        let link: URL
    }
}

var photourl: URL?

func uploadImage(uiImage: UIImage) {
    let headers: HTTPHeaders = [
        "Authorization": "Client-ID e167b484264f565",
    ]
    AF.upload(multipartFormData: { (data) in
        let imageData = uiImage.jpegData(compressionQuality: 0.9)
        data.append(imageData!, withName: "image")
        
    }, to: "https://api.imgur.com/3/upload", headers: headers).responseDecodable(of: UploadImage.self, queue: .main, decoder: JSONDecoder()) { (response) in
        switch response.result {
        case .success(let result):
            print(result.data.link)
            photourl = result.data.link
        case .failure(let error):
            print(error)
        }
    }
}
