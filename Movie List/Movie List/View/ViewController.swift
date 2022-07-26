//
//  ViewController.swift
//  Movie List
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!

    private var searchController = UISearchController()
    private var viewModel = MovieViewModel()
    private var movieList = [MovieResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Log.info("viewDidLoad [+]")
        self.title = viewTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.setUpTableView()
        self.setUpSearchController()
        self.bindViewModelData()
        self.viewModel.searchMovie(withQueryString: nil)
    }

    private func setUpTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UINib(nibName: tableViewCellName, bundle: nil), forCellReuseIdentifier: tableViewCellName)
    }

    private func setUpSearchController() {
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.searchController.searchBar.delegate = self
    }

    private func bindViewModelData() {
        viewModel.movieList.bindAndFire { [weak self] list in
            DispatchQueue.main.async {
                self?.movieList = list
                self?.movieTableView.reloadData()
                self?.searchController.searchBar.text = nil
                self?.searchController.searchBar.showsCancelButton = false
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: set dynamic height
        return 200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObject = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath)
        guard let cell = cellObject as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = self.movieList[indexPath.row].title
        cell.overViewLabel.text = self.movieList[indexPath.row].overview
        cell.posterImageView.image = UIImage(named: defaultThumbnailImageName)
        if let imageUrl = self.movieList[indexPath.row].posterUrl {
            cell.posterImageView.loadImage(fromUrl: imageUrl)
        }
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchMovie(withQueryString: searchBar.text)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}
