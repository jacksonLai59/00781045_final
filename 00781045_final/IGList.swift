//
//  IGList.swift
//  00781045_final
//
//  Created by User02 on 2021/1/10.
//

//doesn't work cant fetch IG API
import SwiftUI

//struct IGList: View {
//     @State private var IG = IGData.init(graphql:)
//
//    func fetchIG() {
//        let urlStr = "https://www.instagram.com/taylorswift/?__a=1"
//        print(urlStr)
//          if let url = URL(string: urlStr) {
//              URLSession.shared.dataTask(with: url) { (data, response, error) in
//                  let decoder = JSONDecoder()
//                  if let data = data {
//                   do {
//                    let igData = try decoder.decode(IGData.self, from: data)
//                    IG = igData
//                      } catch  {
//                          print(error)
//                      }
//                  }
//              }.resume()
//          }
//    }

struct IGList: View {
    @State private var igPhotos = [IGData.Graphql.User.Edge_owner_to_timeline_media.Edges]()
    @State private var igData: IGData!
   
    func fetchIG() {
        print("---------------------")
        let urlStr = "https://www.instagram.com/taylorswift/?__a=1"
        print(urlStr)
          if let url = URL(string: urlStr) {
              URLSession.shared.dataTask(with: url) { (data, response, error) in
                  let decoder = JSONDecoder()
                  if let data = data {
                   do {
                    let ig = try decoder.decode(IGData.self, from: data)
                    igData = ig
                    igPhotos = ig.graphql.user.edge_owner_to_timeline_media.edges
                      } catch  {
                          print(error)
                      }
                  }
              }.resume()
          }
    }
    
    var body: some View {
        VStack{
            igData.map{IGImage(url: $0.graphql.user.profile_pic_url_hd)}
            igData.map {Text($0.graphql.user.biography)}
        }.onAppear(perform: {
            fetchIG()
        })
        
    }
}



