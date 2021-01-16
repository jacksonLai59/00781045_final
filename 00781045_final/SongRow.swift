//
//  SongRow.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    
    var body: some View {
        HStack {
            SongImage(url: song.artworkUrl100)
                           .scaledToFill()
                           .frame(width: 100, height: 100)
                           .clipped()

            VStack(alignment: .leading) {
                Text(song.trackName)
                    .bold()
                Text(song.artistName)
                Text(song.collectionName ?? "")
            }
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(artistName: "TaylorSwift", trackName: "Red", collectionName: "cc", previewUrl: URL(string: "https://www.apple.com")!, artworkUrl100: URL(string: "https://www.apple.com")!, trackPrice: 0, releaseDate: Date(), isStreamable: true))
    }
}
