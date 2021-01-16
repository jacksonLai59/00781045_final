//
//  IG.swift
//  00781045_final
//
//  Created by User02 on 2021/1/10.
//

import Foundation

struct IGData: Codable {
    let graphql: Graphql
    
    struct Graphql: Codable {
        let user: User
        
        struct User: Codable {
            let biography: String
            let external_url: URL?
            let edge_followed_by: Edge_followed_by
            
            struct Edge_followed_by: Codable {
                let count: Int
            }
            
            let edge_follow: Edge_follow
            
            struct Edge_follow: Codable {
                let count: Int
            }
            
            let full_name: String
            
            let category_name: String
            
            let edge_owner_to_timeline_media: Edge_owner_to_timeline_media
            
            struct Edge_owner_to_timeline_media: Codable {
                let count: Int
                let edges: [Edges]
                
                struct Edges: Codable {
                    let node: Node
                    
                    struct Node: Codable {
                        let display_url: URL?
                        let thumbnail_src: URL?
                    }
                }
            }
            let profile_pic_url_hd: URL
            
            let username: String
        }
    }
}


//import Foundation
//
//struct IGData: Codable {
//    let graphql: Graphql
//}
//
//struct Graphql: Codable {
//    let user: User
//}
//
//struct User: Codable {
//    let biography: String
//    let edge_followed_by: Edge_followed_by
//    let edge_follow: Edge_follow
//    let full_name: String
//    let category_name: String
//    let profile_pic_url_hd: URL
//    let username: String
//    let edge_owner_to_timeline_media: Edge_owner_to_timeline_media
//}
//
//struct Edge_followed_by: Codable{
//    let fbid: Int
//}
//
//struct Edge_follow: Codable{
//    let count: Int
//}
//
//struct Edge_owner_to_timeline_media: Codable {
//    let count: Int
//    let edges: [Edges]
//}
//
//struct Edges: Codable {
//    let node: Node
//}
//
//struct Node: Codable {
//    let shortcode: String?
//    let display_url: URL?
//    let is_video: Bool?
//    let edge_liked_by: Edge_liked_by
//    let edge_media_to_caption: Edge_media_to_caption
//}
//
//struct Edge_liked_by: Codable{
//    let count: Int
//}
//
//struct Edge_media_to_caption: Codable{
//    let edges: [Edges2]
//}
//
//struct Edges2: Codable{
//    let node: Node2
//}
//
//struct Node2: Codable{
//    let text: String
//}

