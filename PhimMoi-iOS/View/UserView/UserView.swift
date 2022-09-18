//
//  UserView.swift
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
import YouTubePlayerKit

struct UserView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    @EnvironmentObject var appStateVM: AppStateViewModel
    @EnvironmentObject var sessionVM: SessionViewModel
    
    @State var currentUser = ""
    
    @State var showList = false
    
    var body: some View {
        VStack {
            
            Text("Current user: \(currentUser)")
                .onAppear {
                    getCurrentUser()
                }
            
            Button {
                signOutHandler()
            } label: {
                Text("Sign out")
                    .foregroundColor(.red)
            }
            
            Button("Show all movies fetched") {
                print("Total movies in DB: \(movieVM.movies.count)")
                showList = true
            }
            
            if showList {
                List(movieVM.movies, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        Text("ID: \(movie.id)")
                        Text("Title: \(movie.title)")
                        Text("Overview: \(movie.overview!)")
                        Text("Poster: \(movie.posterPath!)")
                        Text("Year: \(movie.releaseYear!)")
                        Text("Genre: \(movie.genre!)")
                        Text("Trailer: \(movie.trailerLink!)")
                    }
                }
            }
        }
    }
    
    func getCurrentUser() {
        if let user = sessionVM.authHandler.currentUser {
            currentUser = user.email!
        } else {
            currentUser = "n/a"
        }
    }
    
    func signOutHandler() {
        sessionVM.sessionState = .signedOut
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
