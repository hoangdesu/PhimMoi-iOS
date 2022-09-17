//
//  SplashScreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    let duration = 1.0
    
    var body: some View {
        Text("Splash")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        appStateVM.appState = .homescreen
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
