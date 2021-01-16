//
//  FacebookView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct FacebookView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let facebookView = WKWebView()
        if let url = URL(string: "https://www.facebook.com/TaylorSwift/?hc_ref=ARQi1lgotInEOmGaDIXZNkiKB1lC3Xpy4Bd-y563WlBfHo_b8elV4DDfCEFOMY4G51s&fref=nf&__tn__=kC-R") {
            let request = URLRequest(url: url)
            facebookView.load(request)
        }
        return facebookView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct FacebookView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookView()
    }
}
