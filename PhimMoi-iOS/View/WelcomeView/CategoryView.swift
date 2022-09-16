//
//  CategoryView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI

let category = "My List"
let poster = "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg"
let poster1 = "https://i.pinimg.com/736x/74/f6/87/74f687c316ea2304bc42611f818495f2.jpg"



struct CategoryView: View {
    
    var body: some View {
        VStack {
            HStack{
                Text(category)
                    .bold()
                Spacer()
                Image(systemName: "arrow.right")
            }
            .padding(10)
            .padding(.trailing, 20)
            .padding(.leading, 20)
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 20) {
                    PosterCard(link: poster)
                        
                    PosterCard(link: poster1)
                    PosterCard(link: poster)
                    PosterCard(link: poster1)
                    PosterCard(link: poster)
                    PosterCard(link: poster1)
                    PosterCard(link: poster)
                    PosterCard(link: poster1)
                    PosterCard(link: poster)
                    PosterCard(link: poster1)
                    
                }.padding(20)
            }
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
