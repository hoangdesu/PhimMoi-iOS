//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
//

import SwiftUI
import Foundation

let movie = Movie(id: "1", title: "The Nutcracker and The Four Realms", posterPath: "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg", overview:
                    "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.", releaseYear: "2020", genre: "Adventure", trailerLink: "https://youtu.be/DotnJ7tTA34", language: "English", length: "2h")

struct HomeView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    @State private var search = false
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        // display search view
                        NavigationLink(destination: SearchView(movieVM: _movieVM),
                                       isActive: self.$search)
                        { EmptyView() }
                            .frame(width: 0, height: 0)
                            .disabled(true)
                        
                        // MARK: - Featured movies
                        Text("Featured movies")
                            .modifier(FeatureTextModifier())
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                FeatureCard()
                                FeatureCard()
                                FeatureCard()
                            }.padding(20)
                        }
                        
                        CategoryView(headline: "Top picks")
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        HStack {
                            Spacer()
                            Text("PhimMoi")
                                .bold()
                            Spacer()
                            Button(action: { self.search = true }) {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            movieVM.fetchMovies()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
