//
//  AddMovieView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct AddMovieView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    // Movie states
    @State private var inpTitle = ""
    @State private var inpPosterPath = ""
    @State private var inpOverview = ""
    @State private var inpReleaseYear = ""
    @State private var inpGenre = ""
    @State private var inpTrailerLink = ""
    @State private var inpLanguage = ""
    @State private var inpLength = ""
    
    // Alert states
    @State private var showAddSuccessAlert = false
    @State private var showAddFailAlert = false
    
    // Picker
    let genres = ["Action", "Comedy", "Fantasy", "Horror", "Adventure", "Mystery", "Drama", "Science Fiction", "Thriller", "Romance", "Musical"]
    
    // PhotoPicker
    //    @State private var selectedImageData: Data? = nil
    @State private var showImagePickerSheet = false
    @State private var inputImage = UIImage(named: "poster-placeholder")
    @State private var image: Image?
    
    func addMovieHandler() {
        let newMovie = Movie(id: UUID().uuidString,
                             title: inpTitle,
                             posterPath: inpPosterPath,
                             overview: inpOverview,
                             releaseYear: inpReleaseYear,
                             genre: inpGenre,
                             trailerLink: inpTrailerLink,
                             language: inpLanguage,
                             length: inpLength)
        
        let addMovieSucceeded = movieVM.addMovie(movie: newMovie)
        
        // display add movie operation status
        if addMovieSucceeded {
            
            showAddSuccessAlert = true
        } else {
            showAddFailAlert = true
        }
        
        clearForm()
    }
    
    func clearForm() {
        inpTitle = ""
        inpPosterPath = ""
        inpOverview = ""
        inpReleaseYear = ""
        inpGenre = ""
        inpTrailerLink = ""
        inpLanguage = ""
        inpLength = ""
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func uploadImageHandler() {
        guard let inputImage = self.inputImage else { return }
        
        movieVM.uploadImage(image: inputImage)
        
    }
    
    // MARK: - FORM VIEW
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: SectionHeader("Movie Title")) {
                    TextEditor(text: $inpTitle)
                }
                
                Section(header: SectionHeader("Overview")) {
                    TextEditor(text: $inpOverview)
                }
                
                Section(header: SectionHeader("Genre")) {
                    Picker("Select genre", selection: $inpGenre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: SectionHeader("Poster")) {
                    if let inputImage = self.inputImage {
                        Image(uiImage: inputImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                            .onTapGesture {
                                showImagePickerSheet = true
                            }
                    } else {
                        Image("poster-placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                            .onTapGesture {
                                showImagePickerSheet = true
                            }
                    }
                        
                    
                    // FOR TESTING ONLY
                    Button("Upload image (TEST)") {
                        uploadImageHandler()
                    }
                    
                    Text("Recently upload photo from Firebase")
                    
                    if movieVM.mockPosterURL != "" {
                        KFImage(URL(string: movieVM.mockPosterURL)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                    }
                    
                
                }
                
                Section(header: SectionHeader("Release year")) {
                    TextEditor(text: $inpReleaseYear)
                }
                
                Section(header: SectionHeader("Trailer link (Youtube)")) {
                    TextEditor(text: $inpTrailerLink)
                }
                
                Section(header: SectionHeader("Language")) {
                    TextEditor(text: $inpLanguage)
                }
                
                Section(header: SectionHeader("Length")) {
                    TextEditor(text: $inpLength)
                }
                
                
                Button("Add movie") {
                    addMovieHandler()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            
            .navigationTitle("Add new movie")
            .onChange(of: inputImage) { _ in loadImage() }
        } // NavView
        .alert("Success", isPresented: $showAddSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Add movie failed", isPresented: $showAddFailAlert) {
            Button("OK", role: .cancel) { }
        }
        .sheet(isPresented: $showImagePickerSheet) {
            ImagePicker(image: $inputImage)
        }
        
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
