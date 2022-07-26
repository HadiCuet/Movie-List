//
//  MovieInfo.swift
//  Movie List
//

import Foundation
import UIKit

struct MovieInfo: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable {
    let poster_path: String?
    var posterUrl: URL? {
        if let posterPath = poster_path {
            return URL(string: baseImageUrl + posterPath)
        }
        return nil
    }
    let title: String
    let overview: String
    var cellHeight: CGFloat? = defaultCellHeight
}
