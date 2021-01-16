//
//  DcardList.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import SwiftUI

struct DcardList: View {
    
    @State var isShowing: Bool = false
    @State private var dcards = [DcardData]()
    
    func fetchDcard() {
        let urlStr = "https://www.dcard.tw/_api/forums/music/posts"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let posts = try decoder.decode([DcardData].self, from: data)
                        dcards = posts
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    //change navigation bar color
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 0, green: 106/255, blue: 166/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Here are lots of article about music.")
                //Dcard music board list
                List(dcards.indices, id:\.self, rowContent: { (index) in
                    NavigationLink(
                        destination: DcardDetail(dcards: dcards[index]),
                        label: {
                            DcardRow(dcards: dcards[index])
                        })
                })
            }
            .onAppear(perform: {
                fetchDcard()
                configureBackground()
            })
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("Dcard")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .background(PullToRefresh(action: {
                self.isShowing = false
                      }, isShowing: $isShowing))
        }
    }
}
