//
//  NetflixView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct NetflixView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let netflixView = WKWebView()
        if let url = URL(string: "https://www.netflix.com/tw/title/81028336") {
            let request = URLRequest(url: url)
            netflixView.load(request)
        }
        return netflixView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct NetflixView_Previews: PreviewProvider {
    static var previews: some View {
        NetflixView()
    }
}
