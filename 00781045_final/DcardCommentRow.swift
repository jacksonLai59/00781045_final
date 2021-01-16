//
//  DcardCommentRow.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import SwiftUI

struct DcardCommentRow: View {
    var dcards_comments: DcardCommentData
    var body: some View {
        VStack{
            HStack{
                if dcards_comments.gender == "M" {
                    Image("man")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFill()
                } else if dcards_comments.gender == "F" {
                    Image("woman")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFill()
                }
                VStack{
                    if dcards_comments.school == nil {
                        Text("匿名")
                            .foregroundColor(.gray)
                    } else {
                        Text("\(dcards_comments.school!)")
                           
                    }
                    Text("B\(dcards_comments.floor),\(dcards_comments.createdAt)")
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName:"heart.circle.fill")
                    .foregroundColor(.gray)
                Text("\(dcards_comments.likeCount)")
            }
            Text("\(dcards_comments.content)")
        }
       
    }
}
