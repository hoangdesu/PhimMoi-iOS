//
//  AppStateViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import Foundation

class AppStateViewModel: ObservableObject {
    enum AppState {
        case splash
        case homescreen
    }
    
    static let shared = AppStateViewModel()
    
    init() { }
    
    @Published var appState: AppState = .splash
}
