//
//  DetailsMovieViewModel.swift
//  MovieDetailsMVVM
//
//  Created by Luis Fontinelles on 04/03/25.
//

import Foundation

class DetailsMovieViewModel {
    
    var movieData: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieId: Int
    
    init(movie: Movie) {
        self.movieData = movie
        
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
