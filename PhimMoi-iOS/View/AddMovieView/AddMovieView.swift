//
//  AddMovieView.swift
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
        validateInputs()
        
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
    
    func validateInputs() {
        guard !inpTitle.isEmpty ||
              !inpPosterPath.isEmpty ||
              !inpOverview.isEmpty ||
              !inpReleaseYear.isEmpty ||
              !inpGenre.isEmpty ||
              !inpTrailerLink.isEmpty ||
              !inpLanguage.isEmpty ||
              !inpLength.isEmpty
        else {
            print("Missing input values, please double check")
            return
        }
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
//                    Button("Upload image (TEST)") {
//                        uploadImageHandler()
//                    }
                    
//                    Text("Recently upload photo from Firebase")
                    
                    //                    if movieVM.mockPosterURL != "" {
                    //                        KFImage(URL(string: movieVM.mockPosterURL)!)
                    //                            .resizable()
                    //                            .aspectRatio(contentMode: .fit)
                    //                            .frame(width: 200)
                    //                    }
                    
                    
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
