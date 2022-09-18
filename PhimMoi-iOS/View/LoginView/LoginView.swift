//
//  LoginView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 18/09/2022.
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

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    @State var signup = false
    
    @EnvironmentObject var sessionVM: SessionViewModel
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    @State var inpUsername = ""
    @State var inpPassword = ""
    
    var body: some View {
        loginScreen
    }
    
    // MARK: - USE THIS VIEW
    var loginScreen: some View {
        ZStack {
            Image("login")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding(.bottom, 50)
                
                TextField("Username", text: $inpUsername)
                    .disableAutocorrection(true)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .padding([.leading, .trailing], 70)
                
                SecureField("Password", text: $inpPassword)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .textInputAutocapitalization(.never)
                    .padding([.leading, .trailing], 70)
                
                Button(action: {
                    login(email: inpPassword, password: inpPassword)
                    
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing], 100)
                        .background(.red)
                        .cornerRadius(10)
                }) .disabled(false)
                
                Button {
                    signup.toggle()
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing], 98)
                        .background(.red)
                        .cornerRadius(10)
                }
                
                // For testing
                //                Button("Go to home screen") {
                //                    // check if has user, sign in
                //                    withAnimation(.easeIn(duration: 1.0)) {
                //                        sessionVM.sessionState = .signedIn
                //                    }
                //                }
                //
                //                Button("Mock signup") {
                //                    sessionVM.signUp()
                //                }
                
                Button("Quick sign up") {
                    sessionVM.signUp(email: inpUsername, password: inpPassword)
                }
                
                Spacer()
            }
        }
        .alert("Username or Password is invalid!", isPresented: $vm.invalid) {
            Button("Dismiss", action: vm.logPressed)
        }
        .sheet(isPresented: $signup) {
            SignupView()
        }
    }
    
    
    func login(email: String, password: String) {
        withAnimation(.easeIn(duration: 1.0)) {
            sessionVM.signIn(email: email, password: password)
            sessionVM.sessionState = .signedIn
        }
    }
    
    
    
    
    
    // MARK: - archived view
    var oldView: some View {
        ZStack{
            if !vm.authenticated {
                VStack(spacing: 20) {
                    Text("Welcome back **\(vm.username.lowercased())**!")
                    Button("Log out", action: vm.logOut)
                        .tint(.red)
                        .buttonStyle(.bordered)
                }
            } else {
                ZStack {
                    Image("login")
                        .resizable()
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .padding(.bottom, 50)
                        TextField("Username", text: $vm.username)
                            .disableAutocorrection(true)
                            .font(.system(size: 25, weight: .regular, design: .rounded))
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                            .padding([.leading, .trailing], 70)
                        SecureField("Password", text: $vm.password)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 25, weight: .regular, design: .rounded))
                            .textInputAutocapitalization(.never)
                            .padding([.leading, .trailing], 70)
                        Button (action: vm.authenticate,
                                label: {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .padding()
                                .padding([.leading, .trailing], 100)
                                .background(.red)
                                .cornerRadius(10)
                        }) .disabled(false)
                        Button {
                            signup.toggle()
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding()
                                .padding([.leading, .trailing], 98)
                                .background(.red)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                .alert("Username or Password is invalid!", isPresented: $vm.invalid) {
                    Button("Dismiss", action: vm.logPressed)
                }
                .sheet(isPresented: $signup) {
                    SignupView()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
