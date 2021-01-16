//
//  SongDetail.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI
import AVKit

struct SongDetail: View {
    var song: Song
    @State private var player: AVPlayer?
    @State private var isPlayed = false
    @EnvironmentObject var userSetting: UserSetting
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 191/255, green: 93/255, blue: 234/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        
        VStack {
            Text("\(userSetting.name), is this your favorite song?")
                .padding()
            Text(song.trackName)
                .fontWeight(.medium) .font(.title)
            SongImage(url: song.artworkUrl100)
                           .scaledToFill()
                           .frame(width: 300, height: 300)
                           .clipped()
            Button(action: {
                player = AVPlayer(url: song.previewUrl)
                player?.play()
                if isPlayed == true { isPlayed = false }
                else{ isPlayed = true }
            }) {
                if isPlayed == false {
                    Image(systemName: "play.circle.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 50, height: 50)
                } else{
                    Image(systemName: "pause.circle.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 50, height: 50)
                }
            }
        }
        .onDisappear(perform: {
            player?.pause()
            configureBackground()
        })
    }
}
struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: Song(artistName: "aa", trackName: "bb", collectionName: "cc", previewUrl: URL(string: "https://www.apple.com")!, artworkUrl100: URL(string: "https://www.apple.com")!, trackPrice: 0, releaseDate: Date(), isStreamable: true))
    }
}
