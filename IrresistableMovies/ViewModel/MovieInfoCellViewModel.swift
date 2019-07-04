//
//  MovieInfoCellViewModel.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct MovieInfoCellViewModel {
    let title: String
    let overView: String
    let imageUrl: String
    let popularity: String
    let votes: String
}

extension MovieInfoCellViewModel {
    init(movie: MovieInfo) {
        title = movie.title
        overView = "Overview: \n" + movie.overView
        imageUrl = movie.imageUrl
        popularity = "Popularity: \(movie.popularity) %"
        votes = "Votes: \(movie.votes)"
    }
}
