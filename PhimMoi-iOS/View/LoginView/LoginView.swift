//
//  LoginView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 18/09/2022.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    @State var signup = false
    
    @EnvironmentObject var sessionVM: SessionViewModel
    
    var body: some View {
        loginScreen
    }
    
    // MARK: - USE THiS VIEW
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
