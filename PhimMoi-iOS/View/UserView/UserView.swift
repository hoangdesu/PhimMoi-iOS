//
//  UserView.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 15/09/2022.
//

import SwiftUI
import YouTubePlayerKit

struct UserView: View {
    var body: some View {
        VStack{
            Text("User View")
            YouTubePlayerView("https://www.youtube.com/watch?v=6b2WAePdiqA")
                .frame(width: 400, height: 300, alignment: .center)
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
