//
//  SectionHeader.swift
//  PhimMoi-iOS
//
//  Created by Hoang, Nguyen Quoc on 16/09/2022.
//

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
