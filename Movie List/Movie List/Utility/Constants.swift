//
//  Constants.swift
//  Movie List
//

import Foundation
import UIKit

let baseURL: String = "https://api.themoviedb.org/"
let baseImageUrl: String = "https://image.tmdb.org/t/p/original/"
let timeOutInterval: TimeInterval = 20.0

let kApiKeyParam = "api_key"
let kApiKeyValue = "38e61227f85671163c275f9bd95a8803"
let kQueryParam = "query"
let kQueryDefaultValue = "marvel"

let viewTitle = "Movie List"
let tableViewCellName = "MovieTableViewCell"
let defaultThumbnailImageName = "Default_Image_Thumbnail"
let imageCache = NSCache<AnyObject, UIImage>()
