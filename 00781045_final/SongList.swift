//
//  SongList.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct SongList: View {
    
    @State var isShowing: Bool = false
    @EnvironmentObject var userSetting: UserSetting
    @State private var songs = [Song]()
    
    
    func fetchSongs() {
        let urlStr = "https://itunes.apple.com/search?term=TaylorSwift&media=music"
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data,
                   let songResults = try? decoder.decode(SongResults.self, from: data){
                    songs = songResults.results
                } else {
                    print("error")
                }
            }.resume()
        }
    }
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 191/255, green: 93/255, blue: 234/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Enjoy Taylor's music here, \(userSetting.name).")
                List(songs.indices, id:\.self, rowContent: { (index) in
                    NavigationLink(
                        destination: SongDetail(song: songs[index]).environmentObject(userSetting),
                        label: {
                            SongRow(song: songs[index])
                        })
                    
                })
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        
                        Text("Music")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: {
                    fetchSongs()
                    configureBackground()
                })
                .background(PullToRefresh(action: {
                    self.isShowing = false
                          }, isShowing: $isShowing))
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}

