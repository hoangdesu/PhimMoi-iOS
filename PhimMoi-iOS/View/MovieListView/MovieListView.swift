//
//  MovieListView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI
import Firebase
import AVKit
import YouTubePlayerKit

struct MovieListView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                List(movieVM.movies, id: \.id) { movie in
                    Group {
                        Text("ID: \(movie.id)")
                        Text("Title: \(movie.title)")
                        if let overview = movie.overview { // bug: unwrap to no value
                            Text("Overview: \(overview)")
                        }
                    }
                }
                .navigationTitle("Mock movie list")
            }
            
            Button {
                movieVM.fetchMovies()
            } label: {
                Text("Fetch mock movie data from Firebase")
            }
            
        }
    }
    
    
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
