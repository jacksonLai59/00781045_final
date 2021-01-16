//
//  PostcardList.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI

struct PostcardList: View {
    
    @State var searchText: String = ""
    @StateObject var postcardData = PostcardData()
    @State private var showEditLover = false
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 157/255, green: 189/255, blue: 120/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        NavigationView{
//            SearchBar(text: $searchText)
//                .padding(.top, -30)
            List{
                ForEach(postcardData.postcard.indices, id: \.self){ (index) in
                    NavigationLink(destination: PostcardEditor(postcardData: postcardData, editPostcardIndex: index)){
                        PostcardRow(postcard: postcardData.postcard[index])
                    }
                    .listRowBackground(Color(red: 255/255, green: 228/255, blue: 225/255))
                }
                .onDelete { (indexSet) in
                    postcardData.postcard.remove(atOffsets: indexSet)
                }
                .onMove { (indexSet, index) in
                    postcardData.postcard.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    
                    Text("My Postcards")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            })
            .onAppear(perform: {
                configureBackground()
            })
            .navigationTitle("postcard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content:{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        showEditLover = true
                    }, label:{
                        Image(systemName: "book.circle")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            })
            .sheet(isPresented: $showEditLover){
                NavigationView{
                    PostcardEditor(postcardData: postcardData)
                }
            }
        }
        
    }
}


