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
    
    // App's state objects
    @StateObject var appStateVM = AppStateViewModel.shared
    @StateObject var movieVM = MovieViewModel.shared
    @StateObject var sessionVM = SessionViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            switch appStateVM.appState {
            case .splashScreen:
                SplashScreenView()
                    .environmentObject(movieVM)
                    .environmentObject(appStateVM)
                    .environmentObject(sessionVM)
                
            case .contentScreen:
                switch sessionVM.sessionState {
                case .signedOut:
                    LoginView()
                        .environmentObject(sessionVM)
                        .environmentObject(appStateVM)
                    
                case .signedIn:
                    AppScreenView()
                        .environmentObject(movieVM)
                        .environmentObject(appStateVM)
                        .environmentObject(sessionVM)
                }
            }
        }
    }
}
