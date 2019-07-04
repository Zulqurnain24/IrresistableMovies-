//
//  MovieDetail.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 29/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//MovieDetailInfo class
class MovieDetailInfo: NSObject, JSONDecodable {
  
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let tagLine: String
    let imageEndpointString: String
    let popularity: Double
    let votes: Int
    let releaseDate: String
    let runtime: Double
    let revenue: Double
    let genres: [Any]
    let productionCompanies: [Any]
    let spokenLanguages: [Any]
    let voteAverage: Double
    let budget: Int
    let isAdult: Bool
    let homePage: String
    let imdbId: String
    
    required init?(json: [String : Any]) {
        guard let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let originalTitle = json["original_title"] as? String,
            let tagLine = json["tagline"] as? String,
            let overView = json["overview"] as? String,
            let imageEndpointString = json["poster_path"] as? String,
            let popularity = json["popularity"] as? Double,
            let votes = json["vote_count"] as? Int,
            let releaseDate = json["release_date"] as? String,
            let runtime = json["runtime"] as? Double,
            let revenue = json["revenue"] as? Double,
            let genres = json["genres"] as? [Any],
            let productionCompanies = json["production_companies"] as? [Any],
            let spokenLanguages = json["spoken_languages"] as? [Any],
            let voteAverage = json["vote_average"] as? Double,
            let budget = json["budget"] as? Int,
            let isAdult = json["adult"] as? Bool else { return nil }

        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.overview = overView
        self.tagLine = tagLine
        self.imageEndpointString = imageEndpointString
        self.popularity = popularity
        self.votes = votes
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.revenue = revenue
        self.genres = genres
        self.productionCompanies = productionCompanies
        self.spokenLanguages = spokenLanguages
        self.voteAverage = voteAverage
        self.budget = budget
        self.isAdult = isAdult
        guard let homePage = json["homepage"] as? String, let imdbId = json["imdb_id"] as? String else {
            self.homePage = ""
            self.imdbId = ""
            return }
        self.homePage = homePage
        self.imdbId = imdbId

    }
    
    init( id: Int, title: String, originalTitle: String, overview: String, tagLine: String, imageEndpointString: String, popularity: Double, votes: Int, imdbId: String, releaseDate: String, genres: [Any], productionCompanies: [Any], spokenLanguages: [Any], runtime: Double, revenue: Double, voteAverage: Double, budget: Int, isAdult: Bool, homePage: String) {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.overview = overview
        self.tagLine = tagLine
        self.imageEndpointString = imageEndpointString
        self.popularity = popularity
        self.votes = votes
        self.imdbId = imdbId
        self.releaseDate = releaseDate
        self.genres = genres
        self.productionCompanies = productionCompanies
        self.spokenLanguages = spokenLanguages
        self.runtime = runtime
        self.revenue = revenue
        self.voteAverage = voteAverage
        self.budget = budget
        self.isAdult = isAdult
        self.homePage = homePage
    }
}

