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
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State var selectedScreen: Screen = .welcomeView
    
    var body: some View {
        
        // TODO: - Showing items for testing. Remove extras and only show tab items for Homescreen in production
        
        TabView(selection: $selectedScreen) {
            WelcomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Screen.welcomeView)
            
            MovieListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("MovieList")
                }
                .tag(Screen.movieListView)
            
            AddMovieView()
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Add movie")
                }
                .tag(Screen.addMovieView)
            
            UserView()
                .tabItem {
                    Image(systemName: "person")
                    Text("User")
                }
                .tag(Screen.userView)
            
            // put any view here for testing
            UserView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Test")
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
            .environmentObject(MovieViewModel.shared)
    }
}
