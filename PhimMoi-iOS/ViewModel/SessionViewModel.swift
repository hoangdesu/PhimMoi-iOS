//
//  SessionViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
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

import Foundation
import FirebaseAuth

class SessionViewModel: ObservableObject {
    
    static let shared = SessionViewModel()
    let authHandler = Auth.auth()
    
    enum SessionState {
        case signedIn
        case signedOut
    }
    
    init() {
        if isSignedIn {
            sessionState = .signedIn
        }
    }
    
    @Published var sessionState: SessionState = .signedOut
    
    var isSignedIn: Bool {
        return authHandler.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        // mock data
//        let email = "email"
//        let password = "password"
        
        authHandler.signIn(withEmail: email, password: password) { result, err in
            guard result != nil, err == nil else {
                print("Sign in failed: \(err!.localizedDescription)")
                return
            }
            
            // Signin success
            
        }
    }
    
    func signUp(email: String, password: String) {
        // mock data
//        let email = "email@email.com"
//        let password = "password"
//        email.is
        
        authHandler.createUser(withEmail: email, password: password) { result, err in
            guard result != nil, err == nil else {
                print("Create user FAILED: \(err!.localizedDescription)")
                return
            }
            
            // signup success
            print("Signup success")
            
        }
        
        
    }
    
    func signOut() {
        
    }
    
}
