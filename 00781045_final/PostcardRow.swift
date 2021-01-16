//
//  PostcardRow.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI

struct PostcardRow: View {
    var postcard: Postcard
    var body: some View {
        VStack{
            Text(postcard.title)
                .font(.headline).fontWeight(.heavy)
            Text("\(postcard.From) -> \(postcard.To)")
            Text("\(postcard.date)")
                .foregroundColor(.gray)
        }
    }
}

