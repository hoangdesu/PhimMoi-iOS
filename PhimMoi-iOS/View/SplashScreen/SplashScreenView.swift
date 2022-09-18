//
//  SplashScreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
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

struct SplashScreenView: View {
    @State var animate = false
    @EnvironmentObject var movieVM: MovieViewModel
    @EnvironmentObject var appStateVM: AppStateViewModel
    @EnvironmentObject var sessionVM: SessionViewModel
    
    let duration = 1.5
    
    var body: some View {
        ZStack {
            
            Image("logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:animate ? .fill : .fit)
                .frame(width: animate ? nil : 200)
                .scaleEffect(animate ? 4 : 1)
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
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                appStateVM.appState = .contentScreen
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
