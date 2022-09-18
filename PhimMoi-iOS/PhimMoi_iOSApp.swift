//
//  PhimMoi_iOSApp.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: TaylorSwiftUI
  ID:
     - Nguyen Quoc Hoang - s3697305
     - Nguyen Tan Huy - s3864185
     - Nguyen Minh Duy Uyen - s3819342
     - Le Ngoc Duy - s3757327
  Created  date: 31/08/2022
  Last modified: 18/09/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
