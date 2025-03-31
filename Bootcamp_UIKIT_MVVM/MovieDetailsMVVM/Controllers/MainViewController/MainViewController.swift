//
//  MainViewController.swift
//  MovieDetailsMVVM
//
//  Created by Luis Fontinelles on 04/03/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var moviesDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "Top Trending Movies"
        self.view.backgroundColor = .systemBackground
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.moviesDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
        
        DispatchQueue.main.async {
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            let controller = DetailsMovieViewController(viewModel: detailsViewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
