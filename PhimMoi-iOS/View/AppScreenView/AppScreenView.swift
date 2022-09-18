//
//  HomescreenView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
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
