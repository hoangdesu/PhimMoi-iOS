//
//  ContentView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    var body: some View {
        Button("Go to homescreen") {
            appStateVM.appState = .homescreen
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
