//
//  ClientServiceHelper.swift
//  Movie List
//

import Foundation

struct ClientServiceHelper {

    func searchMovieParameters(query: String?) -> [String: String] {
        var paramDict: [String: String] = [:]
        paramDict[kApiKeyParam] = kApiKeyValue
        paramDict[kQueryParam] = query ?? kQueryDefaultValue
        return paramDict
    }
}
