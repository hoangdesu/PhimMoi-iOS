//
//  MovieViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import Foundation
import Firebase

class MovieViewModel: ObservableObject {
    
    // using Singleton design pattern
    static let shared = MovieViewModel()
    
    private init() { }
    
    // Properties
    @Published var movies = [Movie]()
    
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
    
    func sayHello() {
        print("Hello from movieVM")
    }
}
