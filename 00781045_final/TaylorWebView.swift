//
//  TaylorWebView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct TaylorWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let taylorView = WKWebView()
        if let url = URL(string: "https://www.taylorswift.com/") {
            let request = URLRequest(url: url)
            taylorView.load(request)
        }
        return taylorView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct TaylorWebView_Previews: PreviewProvider {
    static var previews: some View {
        TaylorWebView()
    }
}
