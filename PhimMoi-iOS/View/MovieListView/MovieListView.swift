//
//  MovieListView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI
import Firebase
import AVKit
import YouTubePlayerKit

struct MovieListView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    var body: some View {
        
        NavigationView {
            List(movieVM.movies, id: \.id) { movie in
                
                HStack{
                    Image("dino")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                    
                    Text("\(movie.title)")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
            }
            .navigationTitle("Mock movie list")
        }
        
        
    }
}



struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
