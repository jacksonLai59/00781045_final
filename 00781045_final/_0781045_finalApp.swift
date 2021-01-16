//
//  _0781045_finalApp.swift
//  00781045_final
//
//  Created by User09 on 2021/1/11.
//

import SwiftUI
import FacebookCore

@main
struct _0781045_finalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let usersetting = UserSetting()
    var body: some Scene {
        WindowGroup {
//            homepage()
//            Profile()
//            IGList()
//            SongList()
//            YoutubeList()
//            DcardList()
            LoginView()
                .environmentObject(usersetting)
                .onOpenURL(perform: { url in
                 ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                                })
        }
    }
}
