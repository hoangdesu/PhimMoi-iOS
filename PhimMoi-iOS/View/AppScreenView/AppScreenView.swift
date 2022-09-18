//
//  HomescreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI

struct AppScreenView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    enum Screen {
        case welcomeView
        case movieListView
        case addMovieView
        case userView
    }
    
    @State var selectedScreen: Screen = .welcomeView
    
    var body: some View {
        
        TabView(selection: $selectedScreen) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Screen.welcomeView)
            
            MovieListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("My movies")
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
            
        }
        .accentColor(.blue)
        .transition(.opacity)
    }
}

struct AppScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AppScreenView()
            .environmentObject(MovieViewModel.shared)
    }
}
