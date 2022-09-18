//
//  SplashScreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var animate = false
    @EnvironmentObject var movieVM: MovieViewModel
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    let duration = 1.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Image("logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:animate ? .fill : .fit)
                .frame(width: animate ? nil : 200)
                .scaleEffect(animate ? 3 : 1)
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            movieVM.fetchMovies()
            animateSplash()
            
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.easeOut(duration: 1.0)) {
                animate.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(Animation.easeIn(duration: 0)) {
                appStateVM.appState = .homescreen
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
