//
//  SmallDetail.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 17/09/2022.
//

import SwiftUI

struct SmallDetail: View {
    @State var movie: Movie
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Year")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(1)
                Text(movie.releaseYear ?? "")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
            }
            .padding([.leading, .trailing], 20)
            VStack {
                Text("Language")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(1)
                Text(movie.language ?? "")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
            }
            .padding([.leading, .trailing], 20)
            VStack {
                Text("Length")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(1)
                Text(movie.length ?? "")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
            }
            .padding([.leading, .trailing], 20)
            Spacer()
        }
    }
}

struct SmallDetail_Previews: PreviewProvider {
    static var previews: some View {
        SmallDetail(movie: Movie(id: "1", title: "The Nutcracker and The Four Realms", posterPath: "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg", overview:
                                    "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.", releaseYear: "2020", genre: "Adventure", trailerLink: "https://youtu.be/DotnJ7tTA34", language: "English", length: "2h"))
    }
}
