//
//  Login-ViewModel.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 18/09/2022.
//

import Foundation
import SwiftUI

extension LoginView {
    class LoginViewModel: ObservableObject {
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet {objectWillChange.send() }
        }
        @AppStorage("USER_KEY") var username = "username"
        @Published var password = "password"
        @Published var invalid: Bool = false
        
        private var sampleUser = "username"
        private var samplePassword = "password"
        
        init() {
            print("Currently logged on: \(authenticated)")
            print("Currently user: \(username)")
        }
        
        func toggleAuthentication() {
            self.password = ""
            
            withAnimation {
                authenticated.toggle()
            }
        }
        
        func authenticate() {
            guard self.username.lowercased() == sampleUser else {
                self.invalid = true
                return
            }
            guard self.password.lowercased() == samplePassword else {
                self.invalid = true
                return
            }
            toggleAuthentication()
        }
        
        func logOut() {
            toggleAuthentication()
        }
        
        func logPressed() {
            print("Button pressed.")
        }
    }
}
