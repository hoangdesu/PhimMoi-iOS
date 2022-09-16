//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
//

import SwiftUI
import Foundation
import Firebase
import YouTubePlayerKit

let colorNavAppear = UINavigationBarAppearance()

struct WelcomeView: View {
//    @State var movie = [Movie]
    @State var show = false
    @State var  player : YouTubePlayer = ""
//    @EnvironmentObject var movieVM: MovieViewModel

    
    init() {
        colorNavAppear.configureWithOpaqueBackground()
        colorNavAppear.backgroundColor = UIColor.white
//        colorNavAppear.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 15)]
//        colorNavAppear.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 15)]


        UIScrollView.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().standardAppearance =  colorNavAppear
        UINavigationBar.appearance().scrollEdgeAppearance =  colorNavAppear
//        // hide the form background
//        UITableView.appearance().backgroundColor = .clear
//        UINavigationBarAppearance().configureWithTransparentBackground()
//        UINavigationBarAppearance().backgroundColor = .none
//        // hide the background colour of the top toolbar
//        UINavigationBar.appearance().barTintColor = .clear

    }
    var body: some View {
//        NavigationView {
//            List(movie, id: \.id) { movie in
//                Group {
//                    Text("ID: \(movie.id)")
//                    Text("Title: \(movie.title)")
////                    if let overview = movie.overview { // bug: unwrap to no value
////                        Text("Overview: \(overview)")
////                    }
//                    Button {
//                        show.toggle()
//
//                    } label: {
//                        Text("Test")
//                    }
//                    .sheet(isPresented: $show) {
//                        Test(movie: movie)
//                    }
//                }
//            }
//            .navigationTitle("")
//                        .navigationBarTitleDisplayMode(.inline)
//                        .toolbar { // <2>
//                                    ToolbarItem(placement: .principal) { // <3>
//                                        Text("PhimMoi").font(.headline)
//                                    }
//                                }
//        }
        
        
//        NavigationView {
//            NavigationLink{
//                Test()
//            } label: {
//                Text("Test")
//                    .navigationBarTitleDisplayMode(.inline)
//            }.navigationTitle("")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar { // <2>
//                        ToolbarItem(placement: .principal) { // <3>
//                            Text("PhimMoi").font(.headline)
//                        }
//                    }
//        }
        Text("")
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
