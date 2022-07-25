//
//  MovieViewModel.swift
//  Movie List
//

import Foundation

protocol MovieViewModelProtocol {
    var movieList: Bindable<[MovieResult]> { get }
    func searchMovie(withQueryString query: String?)
}

class MovieViewModel: NSObject, MovieViewModelProtocol {
    var movieList: Bindable<[MovieResult]> = Bindable([])
    private var clientService: ClientService

    override init() {
        self.clientService = ClientService()
        super.init()
    }

    func searchMovie(withQueryString query: String?) {
        Log.info("Search movie with query string - \(String(describing: query))")
        self.clientService.searchMovie(query: query) { [weak self] movieList in
            guard let `self` = self else {
                return
            }
            switch movieList {
            case .success(let list):
                self.movieList.value.append(contentsOf: list.results)
            case .failure(let error):
                Log.info(error.localizedDescription)
            }
        }
    }
}
