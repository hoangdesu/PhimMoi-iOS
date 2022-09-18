//
//  AppStateViewModel.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 17/09/2022.
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

import Foundation

class AppStateViewModel: ObservableObject {
    enum AppState {
        case splashScreen
        case contentScreen
    }
    
    static let shared = AppStateViewModel()
    
    init() { }
    
    @Published var appState: AppState = .splashScreen
}
