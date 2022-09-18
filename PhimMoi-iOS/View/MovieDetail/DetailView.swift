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
    @State var favourite = false
    @State var movie: Movie
    @State var youTubePlayer = YouTubePlayer(source: .url(""))
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        KFImage(URL(string: movie.posterPath!)!)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 430)
                            .clipShape(RoundedRectangle(cornerRadius: 120))
                        VStack {
                        KFImage(URL(string: movie.posterPath!)!)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 430, height: 300, alignment: .top)
                            .clipped()
                            Spacer()
                        }
                    }
                    Spacer()
                    HStack{
                        if(favourite) {
                            Button {
                                favourite.toggle()
                                print("like")
                            } label: {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(.red)
                            }
                        } else {
                            Button {
                                favourite.toggle()
                                print("like")
                            } label: {
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        Button {
                            shareButton()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(.gray)
                            
                        }
                    }
                    .padding([.leading, .trailing], 40)
                    Text (movie.title.uppercased())
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .lineSpacing(5)
                        .padding([.leading, .trailing], 20)
                        .padding(.bottom, 10)
                        .padding(.top, 30)
                    
                    Text(movie.genre!.uppercased())
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
                    SmallDetail(movie: movie)
                    
                    Text(movie.overview ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(30)
                    YouTubePlayerView (youTubePlayer)
                        .frame(width: 430, height: 250, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                    
                }
            }
        }
        .onAppear {
            youTubePlayer.source = .url(movie.trailerLink ?? "")
        }
        
    }
    func shareButton() {
        let url = URL(string: movie.trailerLink!)
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: mockMovie)
    }
}
