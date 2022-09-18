//
//  SectionHeader.swift
//  PhimMoi-iOS
//
//  Created by Hoang, Nguyen Quoc on 16/09/2022.
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

struct SectionHeader: View {
    var header: String
    
    init(_ header: String) {
        self.header = header
    }
    
    var body: some View {
        Text("\(self.header) *")
            .font(.headline)
            .bold()
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader("Movie Title")
    }
}
