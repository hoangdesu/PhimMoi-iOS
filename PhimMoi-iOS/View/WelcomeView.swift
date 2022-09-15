//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    var movie: Movie
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
//            LinearGradient(gradient: Gradient(colors: [Color("MovieRed"), Color("MovieDarkRed")]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
//            Color("MovieWhite")
//                .edgesIgnoringSafeArea(.all)
        }.navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
