//
//  CategoryView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    var headline: String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.headline)
                    .modifier(CategogyTextModifier())
                Spacer()
            }
            .padding(10)
            .padding(.trailing, 20)
            .padding(.leading, 20)
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 20) {
                    
                    ForEach(movieVM.movies, id: \.id) { movie in
                        PosterCard(movie: movie)
                    }
                    
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(headline: "Action")
    }
}
