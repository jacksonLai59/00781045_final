//
//  PodcastView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct PodcastView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        let podcastView = WKWebView()
        if let url = URL(string: "https://podcasts.apple.com/tw/podcast/swiftcast-the-1-taylor-swift-podcast/id634257561") {
            let request = URLRequest(url: url)
            podcastView.load(request)
        }
        return podcastView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}
struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView()
    }
}
