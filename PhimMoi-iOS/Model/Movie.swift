//
//  Movie.swift
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

import Foundation

struct Movie: Identifiable, Codable {
    var id: String
    var title: String
    var posterPath: String?
    var overview: String?
    var releaseYear: String?
    var genre: String?
    var trailerLink: String?
    var language: String?
    var length: String?
}

// GLOBAL MOCK Movie data
let mockMovie = Movie(
    id: "1",
    title: "The Nutcracker and The Four Realms",
    posterPath: "https://m.media-amazon.com/images/I/81FaL5dHHeL._AC_SL1500_.jpg",
    overview:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    releaseYear: "2020",
    genre: "Adventure",
    trailerLink: "https://youtu.be/DotnJ7tTA34",
    language: "English",
    length: "2h"
)
