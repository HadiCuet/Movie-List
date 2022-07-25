//
//  MovieInfo.swift
//  Movie List
//

import Foundation

struct MovieInfo: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable {
    let poster_path: String?
    let title: String
    let overview: String
}
