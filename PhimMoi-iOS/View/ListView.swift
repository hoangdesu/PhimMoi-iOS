//
//  ListView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 15/09/2022.
//

import SwiftUI
import Foundation
import Firebase

let colorNavAppear = UINavigationBarAppearance()

struct ListView: View {
    init() {
        colorNavAppear.configureWithOpaqueBackground()
        colorNavAppear.backgroundColor = UIColor(Color("MovieLightBlue"))
        colorNavAppear.titleTextAttributes = [.foregroundColor: UIColor(Color("MovieBlue"))]
        colorNavAppear.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("MovieBlue"))]

        
        UIScrollView.appearance().backgroundColor = UIColor(Color("MovieWhite"))
        UINavigationBar.appearance().standardAppearance =  colorNavAppear
        UINavigationBar.appearance().scrollEdgeAppearance =  colorNavAppear

    }
    @State var movies = [Movie]()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredMovie) { (movie:Movie) in
                    NavigationLink {
//                        MovieCard(movie: movie)
                        WelcomeView(movie:movie)
                    } label: {
                        MovieRow(movie: movie)
                    }
                }.listRowBackground(Color("MovieWhite"))
//                .onDelete { offets in
//                    movies.remove(atOffsets: offets)
//                }
            }.navigationTitle("My Movie List")
             .searchable(text: $searchText, prompt: "Search for a movie")
//            .toolbar {
//                EditButton()
//            }
        }.accentColor(Color("Back"))
//        NavigationView {
//            List(self.movies, id: \.id) { movie in
//                Text("ID=\(movie.id). Title = \(movie.title)")
//            }
//            .navigationTitle("Mock movie list")
//        }
            
        Button {
            fetchMovies()
        } label: {
            Text("Fetch mock movie data from Firebase")
        }
        .padding()
    }
        
    
    func fetchMovies() {
        self.movies.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Movies-test")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    
                    let fetchedMovie = Movie(id: id, title: title)
                    self.movies.append(fetchedMovie)
                }
            }
        }
    }


    
    var filteredMovie: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter{
                $0.id.localizedCaseInsensitiveContains(searchText) ||
//                $0.language.localizedCaseInsensitiveContains(searchText) ||
//                $0.year.localizedCaseInsensitiveContains(searchText) ||
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
