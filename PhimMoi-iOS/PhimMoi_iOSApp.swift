//
//  PhimMoi_iOSApp.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct PhimMoi_iOSApp: App {    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            WelcomeView()
//            ContentView()
            HomescreenView()
        }
    }
}
