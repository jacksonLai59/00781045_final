//
//  YoutubeList.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct YoutubeList: View {
    
    @State var isShowing: Bool = false
    @State private var youtubes = [Item]()
    @EnvironmentObject var userSetting: UserSetting
    
    func fetchYoutube() {
        let urlStr = Keys.urlPlaylistStr
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data,
                   let playlistData = try? decoder.decode(PlaylistData.self, from: data){
                    youtubes = playlistData.items
                } else {
                    print("error")
                }
            }.resume()
        }
    }
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 211/255, green: 35/255, blue: 35/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("\(userSetting.name), here is Taylor's channel.")
                List(youtubes.indices, id:\.self, rowContent: { (index) in
                    NavigationLink(
                        destination: YoutubeDetail(youtube: youtubes[index]).environmentObject(userSetting),
                        label: {
                            YoutubeRow(youtube: youtubes[index])
                        })
                })
            }
            .onAppear(perform: {
                fetchYoutube()
                configureBackground()
            })
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    
                    Text("Youtube")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .background(PullToRefresh(action: {
                self.isShowing = false
                      }, isShowing: $isShowing))
        }
    }
}
