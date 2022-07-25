//
//  Result.swift
//  Movie List
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
