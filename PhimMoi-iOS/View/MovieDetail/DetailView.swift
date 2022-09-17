//
//  DetailView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher
import YouTubePlayerKit

struct DetailView: View {
    @State var youTubePlayer = YouTubePlayer(source: .url(""))
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    YouTubePlayerView (youTubePlayer)
                        .frame(width: 430, height: 250, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                    Spacer()
                    Text (movie.title.uppercased())
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .lineSpacing(5)
                        .padding([.leading, .trailing], 20)
                        .padding(.bottom, 10)
                        .padding(.top, 30)
                    Text(movie.genre ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .light, design: .serif))
                    SmallDetail(movie: movie)
                    Spacer()
                    Text(movie.overview ?? "")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(30)
                    KFImage(URL(string: movie.posterPath!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 500)
                        .cornerRadius(20)
                }
            }
        }
        .onAppear {
            youTubePlayer.source = .url(movie.trailerLink ?? "")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
