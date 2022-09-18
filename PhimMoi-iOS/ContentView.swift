//
//  ContentView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
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
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    var body: some View {
        Button("Go to homescreen") {
            appStateVM.appState = .contentScreen
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
