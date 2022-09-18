//
//  SessionViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import Foundation
import Firebase

class SessionViewModel: ObservableObject {
    
    static let shared = SessionViewModel()
    
    enum SessionState {
        case loggedIn
        case loggedOut
    }
    
    init() { }
    
    @Published var sessionState: SessionState = .loggedIn
    
}
