//
//  PosterCard.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher

struct PosterCard: View {
    @State var movie: Movie
    
    @State var showDetail = false
    
    var body: some View {
        ZStack {
            if let posterPath = movie.posterPath {
                KFImage(URL(string: posterPath))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: 150, height: 220)
        .cornerRadius(15)
        .shadow(color: Color.gray, radius: 12, x: 0, y: 8)
        .padding(.bottom, 15)
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            DetailView()
        }
    }
}
