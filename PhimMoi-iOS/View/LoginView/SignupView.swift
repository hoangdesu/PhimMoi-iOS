//
//  SignupView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 18/09/2022.
//

import SwiftUI

struct SignupView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
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
                
                TextField("Name", text: $name)
                    .disableAutocorrection(true)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 70)
                
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .padding([.leading, .trailing], 70)
                
                TextField("Password", text: $password)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .textInputAutocapitalization(.never)
                    .padding([.leading, .trailing], 70)
                
                Button {
                    print("signup")
                }
                label: {
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
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
