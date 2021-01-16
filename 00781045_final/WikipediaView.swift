//
//  WikipediaView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct WikipediaView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let wikipediaView = WKWebView()
        if let url = URL(string: "https://en.wikipedia.org/wiki/Taylor_Swift") {
            let request = URLRequest(url: url)
            wikipediaView.load(request)
        }
        return wikipediaView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct WikipediaView_Previews: PreviewProvider {
    static var previews: some View {
        WikipediaView()
    }
}
