//
//  AddMovieView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI

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
    }
    
    // MARK: - FORM VIEW
    var body: some View {
            
            NavigationView {
                
                Form {
                    Section(header: SectionHeader("Movie Title")) {
                        TextEditor(text: $inpTitle)
                    }
                    
                    Section(header: SectionHeader("Genre")) {
                        TextField("Add genre", text: $inpGenre)
                    }
                    
                    
                    Section(header: SectionHeader("Poster")) {
                        TextEditor(text: $inpPosterPath)
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
                    
                    
                    //                    Section(header: Text("Movie")
                    //                        .fontWeight(.bold)) {
                    //                            FormRowView(firstItem: "Username", secondItem: "\(1)")
                    //                            Picker("Music", selection: $selection) {
                    //                                ForEach(2010...2022, id: \.self) {
                    //                                    Text(String($0))
                    //                                }
                    //                            }
                    //                            .pickerStyle(WheelPickerStyle())
                    //
                    //                            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    //                                Text("Select a date")
                    //                            }
                    //                            .pickerStyle(WheelPickerStyle())
                    //
                    //                            Text("Date is \(birthDate.formatted(date: .long, time: .omitted))")
                    //
                    //                        }
                    //                }
                    //                .font(.system(.body, design: .rounded))
                }
                
                .navigationTitle("Add new movie")
        } // NavView
        .alert("Success", isPresented: $showAddSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Add movie failed", isPresented: $showAddFailAlert) {
            Button("OK", role: .cancel) { }
        }
        
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
