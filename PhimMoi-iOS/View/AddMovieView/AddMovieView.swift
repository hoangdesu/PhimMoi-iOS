//
//  AddMovieView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI

struct AddMovieView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State private var movieTitle = ""
    @State var selection = ""
    @State var birthDate = Date()
    @State private var overview = ""
    @State private var genre = ""
    
    
    @State private var showAddSuccessAlert = false
    @State private var showAddFailAlert = false
    
    var body: some View {
        
            
            NavigationView {
                
                Form {
                    Section(header: SectionHeader("Movie Title")) {
                        TextField("Add movie title", text: $movieTitle)
                    }
                    
                    Section(header: SectionHeader("Movie Genre")) {
                        TextField("Add genre", text: $genre)
                    }
                    
                    Section(header: SectionHeader("Overview")) {
                        TextEditor(text: $overview)
                    }
                    
                    Button("Add movie") {
                        let addMovieSuccess = movieVM.addMovie(movie: Movie(id: UUID().uuidString, title: movieTitle, overview: overview))
                        if addMovieSuccess {
                            showAddSuccessAlert = true
                        } else {
                            showAddFailAlert = true
                        }
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

struct FormRowView: View {
    // MARK: - Properties struct
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct SectionHeader: View {
    var header: String
    
    init(_ header: String) {
        self.header = header
    }
    
    var body: some View {
        Text("\(self.header) *")
            .font(.headline)
            .bold()
    }
}
