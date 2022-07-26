//
//  Constants.swift
//  Movie List
//

import Foundation
import UIKit

//MARK: URLs
let baseURL: String = "https://api.themoviedb.org/"
let baseImageUrl: String = "https://image.tmdb.org/t/p/original/"

//MARK: API Key/Value
let kApiKeyParam = "api_key"
let kApiKeyValue = "38e61227f85671163c275f9bd95a8803"
let kQueryParam = "query"
let kQueryDefaultValue = "marvel"

//MARK: Strings
let viewTitle = "Movie List"
let tableViewCellName = "MovieTableViewCell"
let defaultThumbnailImageName = "Default_Image_Thumbnail"

//MARK: NUMBERS
let posterImageWidth: CGFloat = 120
let timeOutInterval: TimeInterval = 20.0
let defaultCellHeight: CGFloat = 180
let labelFontSize: CGFloat = 17

//MARK: Others
let imageCache = NSCache<AnyObject, UIImage>()
