//
//  YoutubeCommentRow.swift
//  00781045_final
//
//  Created by User10 on 2021/1/6.
//

import SwiftUI

struct YoutubeCommentRow: View {
    var comment: Item2
    var body: some View {
        VStack {
            HStack{
                YoutubeImage(url: comment.snippet.topLevelComment.snippet.authorProfileImageUrl)
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red,lineWidth: 3))
                VStack(alignment: .leading) {
                    Text(comment.snippet.topLevelComment.snippet.authorDisplayName)
                        .fontWeight(.medium)
                    Text(comment.snippet.topLevelComment.snippet.textOriginal)
                    Text(comment.snippet.topLevelComment.snippet.publishedAt)
                    
                }
            }
            
        }
    }
}
