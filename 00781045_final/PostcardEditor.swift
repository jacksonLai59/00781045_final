//
//  PostcardEditor.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI

struct PostcardEditor: View {
    @Environment(\.presentationMode) var presentationMode
    
    var postcardData: PostcardData
    var editPostcardIndex: Int?
    @State private var photo = ""
    @State private var title = "[New title]"
    @State private var From = "[Taipei]"
    @State private var To = "[Calagry]"
    @State private var context = "[Content]"
    @State private var date = Date()
    let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            return dateFormatter
        }()
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 157/255, green: 189/255, blue: 120/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        Form{
            photos()
            TextEditor(text: $title)
            DatePicker("Date", selection: $date, in: ...Date(), displayedComponents: .date)
            HStack{
                Text("From:")
                TextEditor(text: $From)
                Text("To:")
                TextEditor(text: $To)
            }
            TextEditor(text: $context)
        }.onAppear(perform:{
            configureBackground()
            if let editPostcardIndex = editPostcardIndex{
                let editPostcard = postcardData.postcard[editPostcardIndex]
                date = dateFormatter.date(from:editPostcard.date)!
                title = editPostcard.title
                From = editPostcard.From
                To = editPostcard.To
                context = editPostcard.context
            }
        })
        .navigationBarTitle(editPostcardIndex == nil ? "Create new postcard" : "My Postcard")
        .toolbar(content: {
            ToolbarItem{
                Button("Save") {
                    let postcard = Postcard(photo: photo, date: dateFormatter.string(from: date), title: title, From: From, To: To, context: context)
                    if let editPostcardIndex = editPostcardIndex {
                        postcardData.postcard[editPostcardIndex] = postcard
                    }
                    else{
                        postcardData.postcard.insert(postcard, at: 0)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        })
        
    }
}

