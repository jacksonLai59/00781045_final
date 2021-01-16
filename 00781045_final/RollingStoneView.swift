//
//  RollingStoneView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct RollingStoneView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let rollingstoneView = WKWebView()
        if let url = URL(string: "https://www.rollingstone.com/charts/songs/") {
            let request = URLRequest(url: url)
            rollingstoneView.load(request)
        }
        return rollingstoneView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct RollingStoneView_Previews: PreviewProvider {
    static var previews: some View {
        RollingStoneView()
    }
}
