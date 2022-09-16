//
//  WelcomeView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 13/09/2022.
//

import SwiftUI
import Foundation
import Firebase

let colorNavAppear = UINavigationBarAppearance()

struct WelcomeView: View {
    init() {
        colorNavAppear.configureWithOpaqueBackground()
        colorNavAppear.backgroundColor = UIColor.white
//        colorNavAppear.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 15)]
//        colorNavAppear.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 15)]


        UIScrollView.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().standardAppearance =  colorNavAppear
        UINavigationBar.appearance().scrollEdgeAppearance =  colorNavAppear
        // hide the form background
        UITableView.appearance().backgroundColor = .clear
        UINavigationBarAppearance().configureWithTransparentBackground()
        UINavigationBarAppearance().backgroundColor = .none
        // hide the background colour of the top toolbar
        UINavigationBar.appearance().barTintColor = .clear

    }
    var body: some View {
        NavigationView {
            NavigationLink{
                Test()
            } label: {
                Text("Test")
                    .navigationBarTitleDisplayMode(.inline)
            }.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // <2>
                        ToolbarItem(placement: .principal) { // <3>
                            Text("PhimMoi").font(.headline)
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
