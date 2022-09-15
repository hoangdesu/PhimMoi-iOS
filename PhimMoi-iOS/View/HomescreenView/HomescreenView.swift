//
//  HomescreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI

enum Screen {
    case welcomeView
    case movieListView
    case addMovieView
    case userView
}

struct HomescreenView: View {
    
    @State var selectedScreen: Screen = .addMovieView
    
    var body: some View {
        
        // TODO: - Showing items for testing. Remove extras and only show tab items for Homescreen in production
        
        TabView(selection: $selectedScreen) {
            WelcomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("WelcomeView")
                }
                .tag(Screen.welcomeView)
            MovieListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("MovieListView")
                }
                .tag(Screen.movieListView)
            AddMovieView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("AddMovieView")
                }
                .tag(Screen.addMovieView)
            UserView()
                .tabItem {
                    Image(systemName: "person")
                    Text("UserView")
                }
                .tag(Screen.userView)
        }
        .accentColor(.blue)
        .transition(.slide)
    }
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView()
    }
}
