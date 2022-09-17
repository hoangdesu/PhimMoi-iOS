//
//  SearchView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State var showDetail = false
    @State private var searchText = ""
    
    var body: some View {
        List {
            ForEach(filteredMovie, id: \.id) { (movies:Movie) in
                HStack{
                    KFImage(URL(string: mockMovie.posterPath!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                    
                    //Text("ID: \(movie.id)")
                    Text("\(mockMovie.title)")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
                .onTapGesture {
                    showDetail.toggle()
                }
                .sheet(isPresented: $showDetail) {
                    DetailView(movie: mockMovie)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        
        
    }
    
    var filteredMovie: [Movie] {
        if searchText.isEmpty {
            return movieVM.movies
        } else {
            return movieVM.movies.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
                //                || $0.language!.localizedCaseInsensitiveContains(searchText) ||
                //                $0.releaseYear!.localizedCaseInsensitiveContains(searchText) ||
                //                $0.genre!.localizedCaseInsensitiveContains(searchText)  ||
                //                $0.length!.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
