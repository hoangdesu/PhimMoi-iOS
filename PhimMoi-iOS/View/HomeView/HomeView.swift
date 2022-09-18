//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
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
import Foundation

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
                                ForEach(movieVM.featuredMovies, id: \.id) { movie in
                                    FeatureCard(movie: movie)
                                }
                            }.padding(20)
                        }
                        
                        // TODO: Create a new movie list for top picks
                        CategoryView(headline: "Top picks", movieList: movieVM.movies.shuffled())
                        
                        CategoryView(headline: "Explore", movieList: movieVM.movies.shuffled())
                        
                        CategoryView(headline: "Action", movieList: movieVM.movies.shuffled())
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        HStack {
                            Text("")
                                .frame(width: 30)
                            
                            Spacer()
                            
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            
                            Spacer()
                            
                            Button(action: { self.search = true }) {
                                Image(systemName: "magnifyingglass")
                            }
                            .frame(width: 30)
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.async {
                        movieVM.getFeaturedMovies()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
