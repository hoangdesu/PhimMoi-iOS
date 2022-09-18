//
//  SplashScreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import SwiftUI

struct SplashScreenView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    @EnvironmentObject var appStateVM: AppStateViewModel
    @EnvironmentObject var sessionVM: SessionViewModel
    
    let duration = 1.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                        withAnimation(.easeIn(duration: 1.0)) {
                            switch sessionVM.sessionState {
                            case .loggedOut:
                                appStateVM.appState = .loginScreen
                            case .loggedIn:
                                appStateVM.appState = .homeScreen
                            }
                        }
                    }
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
