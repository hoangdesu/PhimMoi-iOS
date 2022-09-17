//
//  SplashScreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    var body: some View {
        Button("Go to homescreen") {
            appStateVM.appState = .homescreen
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
