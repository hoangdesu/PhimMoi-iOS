//
//  MovieViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

// constants
let DB_MOVIES_COLLECTION = "movies"

class MovieViewModel: ObservableObject {
    
    // using Singleton design pattern
    static let shared = MovieViewModel()
    
    private init() { }
    
    // Properties
    @Published var movies = [Movie]()
    @Published var selectedMovie: Movie?
    
    @Published var mockPosterURL: String = ""
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    func fetchMovies() {
        self.movies.removeAll()
        
        let ref = db.collection(DB_MOVIES_COLLECTION)
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
    
    func addMovie(movie: Movie) -> Bool {
        
        let ref = db.collection(DB_MOVIES_COLLECTION).document(movie.id)
        
        var err = false
        
        let movieObj = [
            "id": movie.id,
            "title": movie.title,
            "overview": movie.overview ?? "",
            "posterPath": movie.posterPath ?? "",
            "releaseYear": movie.releaseYear ?? "",
            "genre": movie.genre ?? "",
            "trailerLink": movie.trailerLink ?? "",
            "language": movie.language ?? "",
            "length": movie.length ?? "",
        ]
        
        ref.setData(movieObj) { error in
            if let error = error {
                print(error.localizedDescription)
                err = true
            }
        }
        
        // return true when add operation is successful
        if err {
            return false
        }
        
        return true
    }
    
    func uploadImage(image: UIImage) {
        let storageRef = storage.reference()
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        let fileRef = storageRef.child("posters/\(UUID().uuidString).jpg")
        
        let uploadTask = fileRef.putData(imageData, metadata: metadata) { metadata, err in
            if let err = err {
                print("UPLOAD ERROR: \(err)")
                return
            }
            
            fileRef.downloadURL { url, err in

                guard let url = url else { return }
                print(">>> UPLOAD IMAGE URL: \(url.absoluteString)")
                
                self.mockPosterURL = url.absoluteString
                
            }
        }
    }
    
}
