//
//  CommonEnums.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 29/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

//Endpoint enum
enum Endpoint: String {
    case topRatedMovies = "/movie/top_rated?"
    case popularMovies = "/movie/popular?"
    case upcomingMovies = "/movie/upcoming?"
    case searchUrl = "/search/movie?"
    case movieDetail = "/movie/"
}

//MovieDetailCellCategory enum
enum MovieDetailCellCategory: CaseIterable {

    case poster
    case genres
    case detail
    case productionCompanies
    case languages
    case webpageLink
    case trailerLink
}

//Constants Enum
enum Constants: String {
    typealias RawValue = String
    
    case baseUrl = "https://api.themoviedb.org/3"
    case imageFormatterBaseUrl = "https://image.tmdb.org/t/p/w"
    case imdbUrl = "http://m.imdb.com/title/" /* /imdb_id/videogallery */
    case apiKey =  "api_key=56a29f6d7010284157af93df3083d395"
    case urlPostFix = "&language=en-US&page="
    case dateFormat = "yyyy-mm-dd"
    case desiredDateFormat = "MMM d, yyyy"
    case dateFormatter = "en_US_POSIX"
    case popularMoviesPageCounter = "popularMoviesPageCounter"
    case topRatedMoviesPageCounter = "topRatedMoviesPageCounter"
    case upcomingMoviesPageCounter = "upcomingMoviesPageCounter"
    case searchMoviesPageCounter = "searchMoviesPageCounter"
    case watchTrailer = "Watch Movie Trailer"
    case homePage = "Home Page: "
}

//NibName Enum
enum NibName: String {
    typealias RawValue = String
    
    case movieInfoCell = "MovieInfoCell"
    case movieDetailInfoCell = "MovieDetailInfoCell"
    case horizontalScrollingCell = "HorizontalScrollingCell"
    case posterDisplayCell = "PosterDisplayCell"
    case buttonCell = "ButtonCell"
    case labelCell = "LabelCell"
    case collectionViewCell = "CollectionViewCell"
    case multipleCategoriesCell = "MultipleCategoriesCell"
}

//Category Enum
enum Category: Int {
    typealias RawValue = Int
    
    case topRatedMovies = 0
    case popularMovies
    case upcomingMovies
    case searchedMovies
}

//Segue Enum
enum Route: String {
    typealias RawValue = String
    
    case segueToSearchViewController = "segueToSearchViewController"
    case segueToDetailViewController = "segueToDetailViewController"
    case segueToMovieDetailController = "segueToMovieDetailController"
    case segueToTrailerDetailController = "segueToTrailerDetailController"
}

//Height Enum
enum Height: Int {
    typealias RawValue = Int
    
    case poster = 200
    case oneElement = 50
    case detailView = 375
    case zero = 0
}
