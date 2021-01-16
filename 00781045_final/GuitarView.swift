//
//  GuitarView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct GuitarView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let guitarView = WKWebView()
        if let url = URL(string: "https://www.ultimate-guitar.com/artist/taylor_swift_16027") {
            let request = URLRequest(url: url)
            guitarView.load(request)
        }
        return guitarView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView()
    }
}
