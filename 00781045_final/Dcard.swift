//
//  Dcard.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import Foundation

struct DcardData: Codable {
    //article
    let id: Int
    let title: String
    let forumName: String
    let excerpt: String
    let createdAt: String
    let likeCount: Int
    let commentCount: Int
    //writer
    let gender: String
    let school: String?
    
    var mediaMeta: [MediaMeta]
}

struct MediaMeta: Codable {
    var url: URL?
}
