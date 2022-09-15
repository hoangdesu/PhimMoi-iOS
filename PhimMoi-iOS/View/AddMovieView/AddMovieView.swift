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
    @State var overview = ""
    
    var body: some View {
        ZStack {
            NavigationView {
                
                Form {
                    Section(header: SectionHeader("Movie Title")) {
                        TextField("Add movie title", text: $movieTitle)
                    }
                    
                    Section(header: SectionHeader("Movie Genre")) {
                        TextField("Add genre", text: $overview)
                    }
                    
                    Section(header: SectionHeader("Overview")) {
                        TextEditor(text: $overview)
                    }
                    
                    
                    
                    
                    Button("Add movie") {
                        movieVM.addMovie(movie: Movie(id: "1", title: movieTitle, overview: overview))
                    }
                    
                    
                    
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
                
                
                
            }
            
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
