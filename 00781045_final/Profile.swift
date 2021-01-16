//
//  Profile.swift
//  00781045_final
//
//  Created by User09 on 2021/1/12.
//

import SwiftUI

struct Profile: View {
    @State private var show1 = false
    @State private var show2 = false
    @State private var show3 = false
    @State private var show4 = false
    @State private var show5 = false
    @State private var show6 = false
    @State private var show7 = false
    @State private var show8 = false
    @State private var show9 = false
    @State private var show10 = false
    @EnvironmentObject var userSetting: UserSetting
    
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 255/255)
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        
        ScrollView(.vertical) {
            Spacer(minLength: 20)
            Text("  Welcome \(userSetting.name) !  ")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
                .background(Color.init(red: 1, green: 212/255, blue: 229/255))
                .cornerRadius(40)
                .foregroundColor(Color.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.init(red: 1, green: 212/255, blue: 229/255), lineWidth: 5))
            Spacer(minLength: 20)
            let columns = [GridItem(.adaptive(minimum: 150))]
            LazyVGrid(columns: columns) {
                
                NavigationLink(destination: TaylorWebView()){
                    
                    VStack{
                        if show1{
                            Image("1")
                                //Image("taylor")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                                .transition(.opacity)
                        }
                        Text("TaylorSwift.com")
                    }
                }.animation(.linear(duration: 1))
                .onAppear {
                    self.show1 = true
                }.onDisappear {
                    self.show1 = false
                }
                
                
                NavigationLink(destination: WikipediaView()){
                    VStack{
                        if show2{
                            Image("2")
                                //Image("wikipedia")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Wikipedia")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show2 = true
                    }.onDisappear {
                        self.show2 = false
                    }
                }
                
                NavigationLink(destination: FacebookView()){
                    VStack{
                        if show3{
                            Image("3")
                                //Image("facebook")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Facebook")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show3 = true
                    }.onDisappear {
                        self.show3 = false
                    }
                }
                
                NavigationLink(destination: IGView()){
                    VStack{
                        if show4{
                            Image("4")
                                //Image("instagram")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Instagram")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show4 = true
                    }.onDisappear {
                        self.show4 = false
                    }
                }
                
                NavigationLink(destination: TwitterView()){
                    VStack{
                        if show5{
                            Image("5")
                                //Image("twitter")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Twitter")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show5 = true
                    }.onDisappear {
                        self.show5 = false
                    }
                }
                
                NavigationLink(destination: PodcastView()){
                    VStack{
                        if show6{
                            Image("6")
                                //Image("podcast")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Swiftcast")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show6 = true
                    }.onDisappear {
                        self.show6 = false
                    }
                }
                
                NavigationLink(destination: NetflixView()){
                    VStack{
                        if show7{
                            Image("7")
                                //Image("netflix")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Netflix-Miss Americana")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show7 = true
                    }.onDisappear {
                        self.show7 = false
                    }
                }
                
                NavigationLink(destination: GuitarView()){
                    VStack{
                        if show8{
                            Image("8")
                                //Image("guitar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Guitar Spectrum")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show8 = true
                    }.onDisappear {
                        self.show8 = false
                    }
                }
                
                NavigationLink(destination: BillboardView()){
                    VStack{
                        if show9{
                            Image("9")
                                //Image("billboard")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Billboard")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show9 = true
                    }.onDisappear {
                        self.show9 = false
                    }
                }
                
                NavigationLink(destination: RollingStoneView()){
                    VStack{
                        if show10{
                            Image("10")
                                //Image("rollingstone")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .clipped()
                        }
                        Text("Rollingstone")
                    }.animation(.linear(duration: 1))
                    .onAppear {
                        self.show10 = true
                    }.onDisappear {
                        self.show10 = false
                    }
                }
                
            }
        }
        .onAppear(perform: {
            configureBackground()
        })
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("Taylor Swift")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    struct Profile_Previews: PreviewProvider {
        static var previews: some View {
            Profile()
        }
    }
}
