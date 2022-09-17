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
    let movie = Movie(id: "1", title: "The Nutcracker and The Four Realms", posterPath: "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg", overview:
                        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.", releaseYear: "2020", genre: "Adventure", trailerLink: "https://youtu.be/DotnJ7tTA34", language: "English", length: "2h")
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
                    KFImage(URL(string: movie.posterPath ?? "")!)
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
