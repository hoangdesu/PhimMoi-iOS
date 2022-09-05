//
//  ContentView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var movies = [Movie]()
    
    var body: some View {
        NavigationView {
            List(self.movies, id: \.id) { movie in
                Text("ID=\(movie.id). Title = \(movie.title)")
            }
            .navigationTitle("Mock movie list")
        }
            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
