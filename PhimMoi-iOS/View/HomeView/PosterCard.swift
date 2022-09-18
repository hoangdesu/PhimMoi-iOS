//
//  PosterCard.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
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
        .frame(width: 140, height: 210)
        .cornerRadius(16)
        .shadow(color: Color.gray, radius: 12, x: 0, y: 8)
        .padding(.bottom, 15)
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            DetailView(movie: self.movie)
        }
    }
}
