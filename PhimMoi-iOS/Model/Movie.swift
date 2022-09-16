//
//  Movie.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 06/09/2022.
//

import Foundation

struct Movie: Identifiable {
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
