//
//  ViewController.swift
//  Movie List
//

import UIKit

class ViewController: UIViewController {

    private var viewModel = MovieViewModel()
    private var movieList = [MovieResult]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindViewModelData()
    }

    func bindViewModelData() {
        viewModel.searchMovie(withQueryString: nil)
        viewModel.movieList.bindAndFire { [weak self] list in
            DispatchQueue.main.async {
                self?.movieList = list
            }
        }
    }
}

