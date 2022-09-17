//
//  Movie.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

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
