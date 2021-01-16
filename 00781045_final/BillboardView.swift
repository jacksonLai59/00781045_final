//
//  BillboardView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WebKit

struct BillboardView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let billboardView = WKWebView()
        if let url = URL(string: "https://billboard.com/charts/hot-100") {
            let request = URLRequest(url: url)
            billboardView.load(request)
        }
        return billboardView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

struct BillboardView_Previews: PreviewProvider {
    static var previews: some View {
        BillboardView()
    }
}
