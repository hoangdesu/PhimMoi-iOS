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
    @State private var search = false
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            NavigationView {
                ZStack {
                    ScrollView {
                        VStack {
                            NavigationLink(destination: SearchView(),
                                                           isActive: self.$search)
                                            { EmptyView() }
                                                .frame(width: 0, height: 0)
                                                .disabled(true)
                            ScrollView(.horizontal,
                                       showsIndicators: false) {
                                HStack(spacing: 20) {
                                    FeatureCard()
                                    FeatureCard()
                                    FeatureCard()
                                }.padding(20)
                            }
                        }
                    }.navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal){
                            HStack {
                                Spacer()
                                Text("PhimMoi")
                                    .bold()
                                Spacer()
                                Button(action:{ self.search = true }) { Image("search") }
                            }
                        }
                    }
                }
                
                
            }
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
