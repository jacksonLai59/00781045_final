//
//  DcardComment.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import Foundation

struct DcardCommentData: Codable {
    //comment
    let createdAt: String
    let floor: Int
    let content: String
    let likeCount: Int
    //writer
    let gender: String
    let school: String?
}

