//
//  Youtube.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import Foundation


struct PlaylistData: Codable {
    let nextPageToken: String
    let items: [Item]
}

struct Item: Codable {
    let snippet: Snippet
    let contentDetails: ContentDetails
}

struct ContentDetails: Codable {
    let videoId: String         //https://www.youtube.com/watch?v=(videoID)
    let videoPublishedAt: String
}

struct Snippet: Codable {
    let title: String
    let channelTitle: String
    let description: String
    let playlistId: String
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let medium: Default
}

struct Default: Codable {
    let url: URL
    let width, height: Int
}

struct Keys {
    //我的youtube API Key
    static let youtubeAPIKey = "AIzaSyA0POOtvTfjOBSg4RA43ib0p291oKjZ8_g"
    // 取得頻道的資訊（包含影片清單）
    static let urlChannelStr = """
https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=UCqECaJ8Gagnn7YCbPEzWH6g&key=AIzaSyA0POOtvTfjOBSg4RA43ib0p291oKjZ8_g
"""
    //取得影片清單 maxResults = 回傳影片數量（最大50）
    static let urlPlaylistStr = """
https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UUqECaJ8Gagnn7YCbPEzWH6g&key=AIzaSyA0POOtvTfjOBSg4RA43ib0p291oKjZ8_g&maxResults=50
"""
    /*
  //取得留言資料 (videoId)
     static let urlcomment = """https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,replies&videoId=vBbMnDFy4YY&key=AIzaSyA0POOtvTfjOBSg4RA43ib0p291oKjZ8_g
"""
*/
}
