//
//  DcardRow.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import SwiftUI

struct DcardRow: View {
    var dcards: DcardData
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                //writer
                HStack{
                    if dcards.gender == "M" {
                        Image("man")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFill()
                    } else if dcards.gender == "F" {
                        Image("woman")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFill()
                    }
                    if dcards.school == nil {
                        Text("匿名")
                            .foregroundColor(.gray)
                    } else {
                        Text("\(dcards.school!)")
                            .foregroundColor(.gray)
                    }
                }
                //title
                Text(dcards.title)
                    .fontWeight(.medium)
                //likes and comments
                HStack{
                    Image(systemName:"heart.circle.fill")
                        .foregroundColor(.red)
                    Text("\(dcards.likeCount)")
                    Image(systemName:"bubble.right.fill")
                        .foregroundColor(.blue)
                    Text("\(dcards.commentCount)")
                        
                }
            }
        }
    }
}
