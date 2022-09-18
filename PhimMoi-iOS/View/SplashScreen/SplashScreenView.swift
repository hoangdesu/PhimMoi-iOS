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
    
    let duration = 1.5
    
    var body: some View {
        ZStack {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                        withAnimation(.easeIn(duration: 1.0)) {
                            appStateVM.appState = .contentScreen
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
