//
//  homepage.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI


struct homepage: View {
    
    var body: some View {
        TabView{
            Profile()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("profile") }}
            SongList()
                .tabItem {
                    VStack{
                        Image(systemName: "music.house")
                        Text("music") }}
            YoutubeList()
                .tabItem {
                    VStack{
                        Image(systemName: "play.rectangle")
                        Text("video") }}
            DcardList()
                .tabItem {
                    VStack{
                        Image(systemName: "doc")
                        Text("dcard") }}
            PostcardList()
                .tabItem {
                    VStack{
                        Image(systemName: "paperplane")
                        Text("postcards") }}
        }
//        .background(Image("background").resizable().edgesIgnoringSafeArea(.all).scaledToFit().opacity(0.6))
    }
}

struct homepage_Previews: PreviewProvider {
    static var previews: some View {
        homepage()
    }
}
