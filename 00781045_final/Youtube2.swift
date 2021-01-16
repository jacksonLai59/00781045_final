//
//  Youtube2.swift
//  00781045_final
//
//  Created by User10 on 2021/1/6.
//

import Foundation


struct CommentData: Codable {
    let items: [Item2]
}

struct Item2: Codable {
    let snippet: Snippet2
}

struct Snippet2: Codable {
    let videoId: String
    let topLevelComment: TopLevelComment
}

struct TopLevelComment: Codable {
    let snippet: Snippet_2
}

struct Snippet_2: Codable{
    let textOriginal: String
    let authorDisplayName: String
    let authorProfileImageUrl: URL
    let authorChannelUrl:URL
    let publishedAt: String
}
