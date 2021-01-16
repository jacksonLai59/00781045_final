//
//  postcard.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI
import Foundation


struct Postcard: Identifiable, Codable {
    let id = UUID()
    var photo: String
    var date: String
    var title: String
    var From: String
    var To: String
    var context: String
}

