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
                    movieVM.fetchMovies()
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                        withAnimation(.easeIn(duration: 1.0)) {
                            appStateVM.appState = .homescreen
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
