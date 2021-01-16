//
//  Song.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import Foundation

struct SongResults: Codable {
   let resultCount: Int
   let results: [Song]
}

struct Song: Codable {
   let artistName: String
   let trackName: String
   let collectionName: String?
   let previewUrl: URL
   let artworkUrl100: URL
   let trackPrice: Double?
   let releaseDate: Date
   let isStreamable: Bool?
}
