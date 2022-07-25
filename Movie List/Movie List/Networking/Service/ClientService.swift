//
//  ClientService.swift
//  Movie List
//

import Foundation

protocol ClientServiceProtocol {
    func searchMovie(query: String?, _ completion: @escaping (Result<MovieInfo>) -> ())
}

struct ClientService: ClientServiceProtocol {

    let session = URLSession(configuration: .default)
    let serviceHelper = ClientServiceHelper()

    func searchMovie(query: String?, _ completion: @escaping (Result<MovieInfo>) -> ()) {

        let parameters = serviceHelper.searchMovieParameters(query: query)
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .searchMovie, with: parameters, includes: nil, contains: nil, and: .get)

            session.dataTask(with: request) { (data, res, err) in

                guard err == nil else {
                    completion(.failure(HTTPNetworkError.dataTaskFailed))
                    return
                }

                guard let response = res as? HTTPURLResponse, let unwrappedData = data else {
                    completion(Result.failure(HTTPNetworkError.noData))
                    return
                }

                let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                switch result {

                case .success:
                    guard let movieInfo = try? JSONDecoder().decode(MovieInfo.self, from: unwrappedData) else {
                        Log.info("[Error] Movie info json decoding failed")
                        completion(.failure(HTTPNetworkError.decodingFailed))
                        return
                    }
                    Log.info("[Success] Movie list response count - \(movieInfo.results.count)")
                    completion(.success(movieInfo))

                case .failure (let cause):
                    Log.info("[Error] Network response failed - \(cause.localizedDescription)")
                    completion(.failure(cause))
                }
            }.resume()
        }
        catch (let ex) {
            Log.info("[Exception] Get movie info exception - \(ex.localizedDescription)")
            completion(.failure(HTTPNetworkError.badRequest))
        }
    }
}
