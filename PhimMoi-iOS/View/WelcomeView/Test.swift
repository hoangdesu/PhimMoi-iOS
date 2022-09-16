//
//  Test.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import YouTubePlayerKit

struct Test: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    YouTubePlayerView("https://www.youtube.com/watch?v=6b2WAePdiqA")
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 300, alignment: .center)
                        
                    Spacer()
                }
            }
        }
        
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
