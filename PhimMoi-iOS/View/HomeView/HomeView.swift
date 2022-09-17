//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
//

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
                                FeatureCard()
                                FeatureCard()
                                FeatureCard()
                            }.padding(20)
                        }
                        
                        // TODO: Create a new movie list for top picks
                        CategoryView(headline: "Top picks", movieList: movieVM.movies)
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
