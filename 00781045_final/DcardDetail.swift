//
//  DcardDetail.swift
//  00781045_final
//
//  Created by User02 on 2021/1/9.
//

import SwiftUI

struct DcardDetail: View {
    var dcards: DcardData
    @State private var posts = DcardPostData.init(content: "", commentCount: 0)
    @State private var comments = [DcardCommentData]()
    
    func fetchDcardPost() {
        let urlStr = "https://www.dcard.tw/_api/posts/\(dcards.id)"
        print(urlStr)
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let postdata = try decoder.decode(DcardPostData.self, from: data)
                        posts = postdata
                        print(posts.content)
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    func fetchDcardComment() {
        let urlStr = "https://www.dcard.tw/_api/posts/\(dcards.id)/comments"
        print("----------comment-----------")
        print(urlStr)
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let commentdata = try decoder.decode([DcardCommentData].self, from: data)
                        comments = commentdata
                        print(comments)
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
        VStack(alignment: .center, spacing: nil, content: {
            //some space
            Text("")
            //writer
            HStack(alignment: .top, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                if dcards.gender == "M" {
                    Image("man")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                } else if dcards.gender == "F" {
                    Image("woman")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                }
                VStack{
                    if dcards.school == nil {
                        Text("匿名")
                            .foregroundColor(.black)
                    } else {
                        Text("\(dcards.school!)")
                            .foregroundColor(.black)
                        if dcards.gender == "M" {
                            Text("男生")
                                .foregroundColor(.gray)
                        } else if dcards.gender == "F" {
                            Text("女生")
                                .foregroundColor(.gray)
                        }
                    }                }
            })
            //title & time
            Text("\(dcards.title)")
                .fontWeight(.medium)
            HStack{
                Text("\(dcards.forumName)")
                    .foregroundColor(.blue)
                Text("\(dcards.createdAt)")
                    .foregroundColor(.gray)
            }
            //content
            Text(posts.content)
                .padding()
            //comments
            if posts.commentCount == 0{
                Text("[No Comment]").bold()
            }
            else {
                Text("Comments").fontWeight(.medium)
                List(comments.indices, id:\.self, rowContent: { (index) in
                    DcardCommentRow(dcards_comments: comments[index])
                })
            }
        }).onAppear(perform: {
            fetchDcardPost()
            fetchDcardComment()
            configureBackground()
        })
    }
}


