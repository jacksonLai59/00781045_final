//
//  YoutubeRow.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct YoutubeRow: View {
    var youtube: Item
    var body: some View {
        HStack {
            YoutubeImage(url: youtube.snippet.thumbnails.medium.url)
                           .scaledToFill()
                           .frame(width: 150, height: 100)
                           .clipped()

            VStack(alignment: .leading) {
                Text(youtube.snippet.title)
                    .bold()
            }
        }
    }
}
