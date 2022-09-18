//
//  SessionViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import Foundation
import FirebaseAuth

class SessionViewModel: ObservableObject {
    
    static let shared = SessionViewModel()
    let authHandler = Auth.auth()
    
    enum SessionState {
        case signedIn
        case signedOut
    }
    
    init() { }
    
    @Published var sessionState: SessionState = .signedOut
    
    var isSignedIn: Bool {
        return authHandler.currentUser != nil
    }
    
    func signIn() {
        
        let email = "email"
        let password = "password"
        
        authHandler.signIn(withEmail: email, password: password) { result, err in
            guard result != nil, err == nil else {
                print("Sign in failed: \(err!.localizedDescription)")
                return
            }
            
            // Signin success
            
        }
    }
    
    func signUp() {
        
    }
    
    func signOut() {
        
    }
    
}
