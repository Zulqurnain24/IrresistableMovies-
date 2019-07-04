//
//  MovieInfoDetailCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct MovieInfoDetailCellViewModel {
    let title: String
    let originalTitle: String
    let overview: String
    let tagLine: String
    let popularity: String
    let votes: String
    let voteAverage: String
    let budget: String
    let isAdult: String
    let releaseDate: String
    let runtime: String
    let revenue: String
    let genres: [Any]
    let productionCompanies: [Any]
    let spokenLanguages: [Any]
    let homePage: String
    let imdbId: String
    let imageURLString: String
}

extension MovieInfoDetailCellViewModel {
    init(movieDetailInfo: MovieDetailInfo) {
        title = "Title: " + movieDetailInfo.title
        originalTitle = "Original Title: " + movieDetailInfo.originalTitle
        overview = "Overview: " + movieDetailInfo.overview
        tagLine = "Tag Line: " + movieDetailInfo.tagLine
        popularity = "Popularity: \(movieDetailInfo.popularity) %"
        votes = "Votes: \(movieDetailInfo.votes)"
        voteAverage = "Vote Average: \(movieDetailInfo.voteAverage)"
        budget = "Budget: U$ \(movieDetailInfo.budget)"
        isAdult = "Parental Guidance Required: \(movieDetailInfo.isAdult ? "Yes" : "No")"
        releaseDate = "Release Date: \(UtilityFunctions.shared.formatDate(dateString: movieDetailInfo.releaseDate))"
        runtime = "Run Time: U$ \(movieDetailInfo.runtime)"
        revenue = "Revenue: U$ \(movieDetailInfo.revenue)"
        genres = movieDetailInfo.genres
        productionCompanies = movieDetailInfo.productionCompanies
        spokenLanguages = movieDetailInfo.spokenLanguages
        homePage = !movieDetailInfo.homePage.isEmpty ? movieDetailInfo.homePage : "Home Page Link Not Available"
        imdbId = !movieDetailInfo.imdbId.isEmpty ? movieDetailInfo.imdbId : ""
        imageURLString = UtilityFunctions.shared.generateImageUrl(imageSize: 300, endPoint: movieDetailInfo.imageEndpointString)
    }
}
