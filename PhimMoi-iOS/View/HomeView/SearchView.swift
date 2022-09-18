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
            ForEach(filteredMovie, id: \.id) { movie in
                HStack{
                    KFImage(URL(string: movie.posterPath!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                        .padding(.trailing, 4)
                    
                    Text("\(movie.title)")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
                .onTapGesture {
                    showDetail.toggle()
                }
                .sheet(isPresented: $showDetail) {
                    DetailView(movie: movie)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        
    }
    
    var filteredMovie: [Movie] {
        if searchText.isEmpty {
            return []
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
