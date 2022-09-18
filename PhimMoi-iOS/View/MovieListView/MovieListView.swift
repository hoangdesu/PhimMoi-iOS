//
//  MovieListView.swift
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
import Firebase
import Kingfisher


struct MovieListView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State private var showDetail = false
    
    var body: some View {
        
        NavigationView {
            List(movieVM.movies, id: \.id) { movie in
                
                HStack {
                    KFImage(URL(string: movie.posterPath!))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                        .padding(.trailing, 5)
                    
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
            .navigationTitle("My movies ♥")
        }
        
    }
}



struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
