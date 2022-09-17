//
//  CategoryView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI

struct CategoryView: View {
    
    var body: some View {
        VStack {
            HStack{
                Text(movie.genre ?? "")
                    .bold()
                Spacer()
            }
            .padding(10)
            .padding(.trailing, 20)
            .padding(.leading, 20)
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 20) {
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    PosterCard(link: movie.posterPath!)
                    
                }.padding(20)
            }
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
