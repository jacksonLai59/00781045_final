//
//  PostcardData.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI

class PostcardData: ObservableObject {
    @AppStorage("postcard") var postcardData: Data?
    
    init(){
        if let postcardData = postcardData {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Postcard].self, from: postcardData){
                postcard = decodedData
            }
        }
    }
    @Published var postcard = [Postcard](){
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(postcard)
                postcardData = data
            } catch {
                print(error)
            }
        }
    }
}
