//
//  LoginView.swift
//  00781045_final
//
//  Created by User02 on 2021/1/12.
//

import SwiftUI
import WidgetKit
import FacebookLogin

struct LoginView: View {
    
    @State private var offset = CGSize.zero
    @State private var newPosition = CGSize.zero
    @EnvironmentObject var userSetting: UserSetting
    @State private var showAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                //title
                Text("Taylor Swift").font(.system(size: 60)).fontWeight(.heavy)
                Text("for every swiftie")
                    .font(.system(size: 30)).foregroundColor(.black)
                Text("by 賴玠淳 from NTOU for iOS final project")
                    .foregroundColor(.gray)
                //photo
                Image("first")
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                offset = CGSize(width: value.translation.width + newPosition.width,
                                                height: value.translation.height + newPosition.height)
                            })
                            .onEnded({ (value) in
                                newPosition = offset
                            })
                        )
                        HStack{
                            //enter your name
                            TextField("Enter your name", text: $userSetting.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            //button for userdefaults to finalwidget
                            Button(action: {let userDefaults = UserDefaults(suiteName: "group.00781045")
                                userDefaults?.set(userSetting.name, forKey: "name")
                                WidgetCenter.shared.reloadAllTimelines()
                            }){
                                Image(systemName: "checkmark.rectangle")
                            }
                        }
                        .padding()
                        //login facebook
                        Button(action: {
                        showAlert = true
                        //if AccessToken.current != nil {Text("Welcome \(AccessToken.current!.userID)")} else {Text("Facebook")}
                        }) {
                        Text("   Facebook   ")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .padding()
                        .background(Color.init(red: 0, green: 106/255, blue: 166/255))
                        .cornerRadius(40)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.init(red: 0, green: 106/255, blue: 166/255), lineWidth: 5))
                        }.alert(isPresented: $showAlert) { () -> Alert in
                        return Alert(title: Text("Hey, How can I help you?"), message: Text("Tell me what you want to do."), primaryButton: .default(Text("Login"), action: {
                        //login facebiook
                        let manager = LoginManager()
                        manager.logIn { (result) in
                        if case LoginResult.success(granted: _, declined: _, token: _) = result {
                        print("login ok")
                        } else {
                        print("login fail")
                        }
                        }
                        }), secondaryButton: .default(Text("Logout"), action: {
                        //logout facebook
                        let manager = LoginManager()
                        manager.logOut()}))
                        }
                        //just want some space
                        Text("")
                        //enter to home page
                        NavigationLink(
                        destination: homepage().environmentObject(userSetting),
                        label: {
                        Text("       Enter       ")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.green, lineWidth: 5))
                        })
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Image("background").resizable().edgesIgnoringSafeArea(.all).scaledToFit().opacity(0.6))
            
            
        }
    }
    
}




