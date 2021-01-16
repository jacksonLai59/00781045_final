//
//  YoutubeDetail.swift
//  00781045_final
//
//  Created by User02 on 2021/1/5.
//

import SwiftUI

struct YoutubeDetail: View {
    var youtube: Item
    @State private var isExpanded = true
    @State private var isExpanded2 = true
    @State private var comments = [Item2]()
    @EnvironmentObject var userSetting: UserSetting
    
    func fetchYoutube2() {
        let urlStr = "https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,replies&videoId=\(youtube.contentDetails.videoId)&key=\(Keys.youtubeAPIKey)"
        print("fetch", urlStr)

        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let commentData = try decoder.decode(CommentData.self, from: data)
                        comments = commentData.items
                        print(comments)
                    } catch  {
                        print(error)
                    }
                }
                
            }.resume()
        }
    }
    
//    func configureBackground() {
//        let barAppearance = UINavigationBarAppearance()
//        barAppearance.backgroundColor = UIColor.init(red: 211/255, green: 35/255, blue: 35/255, alpha: 255/255)
//        UINavigationBar.appearance().standardAppearance = barAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
//    }
    
    var body: some View {
        
        VStack {
            Text("\(userSetting.name), click to watch!")
            
            Link(destination: URL(string: "https://www.youtube.com/watch?v=\(youtube.contentDetails.videoId)")!, label: {
                ZStack{
                    YoutubeImage(url: youtube.snippet.thumbnails.medium.url)
                            .scaledToFill()
                            .frame(width: 350, height: 250)
                            .clipped()
                    Image(systemName: "play.circle.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 80, height: 80)
                }
            })
            .buttonStyle(PlainButtonStyle())
            Text(youtube.snippet.title)
                .bold().fontWeight(.heavy)
            Form{
                
                HStack{
                    Text("Published time:").fontWeight(.medium)
                    Text(youtube.contentDetails.videoPublishedAt)
                }
                DisclosureGroup(
                    isExpanded: $isExpanded,
                    content: {
                        Text(youtube.snippet.description)
                    },
                    label: {
                                Label("Description", systemImage: "text.book.closed.fill")
                    })
                DisclosureGroup(
                    isExpanded: $isExpanded2,
                    content: {
                        List(comments.indices, id:\.self, rowContent: { (index) in
                            YoutubeCommentRow(comment: comments[index])
                        })
                    },
                    label: {
                                Label("Comments", systemImage: "text.bubble.fill")
                    })
            }
        }.onAppear(perform: {
            fetchYoutube2()
//            configureBackground()
        })
    }
}
