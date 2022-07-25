//
//  MovieInfo.swift
//  Movie List
//

import Foundation

struct MovieInfo: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let poster_path: String?
    let title: String
    let overview: String
}
