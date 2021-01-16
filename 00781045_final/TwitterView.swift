//
//  TwitterView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct TwitterView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let twitterView = WKWebView()
        if let url = URL(string: "https://twitter.com/taylorswift13") {
            let request = URLRequest(url: url)
            twitterView.load(request)
        }
        return twitterView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
    }
}
