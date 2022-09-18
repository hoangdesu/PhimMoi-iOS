//
//  UserView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI
import YouTubePlayerKit

struct UserView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State var showList = false
    
    var body: some View {
        VStack{
            Button("Show all movies fetched") {
                movieVM.fetchMovies()
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
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
