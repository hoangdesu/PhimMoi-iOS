//
//  AppStateViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import Foundation

class AppStateViewModel: ObservableObject {
    enum AppState {
        case splashScreen
        case contentScreen
    }
    
    static let shared = AppStateViewModel()
    
    init() { }
    
    @Published var appState: AppState = .splashScreen
}
