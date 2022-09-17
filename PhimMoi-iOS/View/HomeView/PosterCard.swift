//
//  PosterCard.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher


struct PosterCard: View {
    @State var link : String
    @State var showDetail = false
    var body: some View {
        ZStack {
            KFImage(URL(string: link)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 150, height: 220)
        .cornerRadius(15)
        .shadow(color: Color.gray, radius: 15, x: 0, y: 10)
        .padding(.bottom, 15)
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            DetailView()
        }
    }
}

struct PosterCard_Previews: PreviewProvider {
    static var previews: some View {
        PosterCard(link: "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg")
    }
}
