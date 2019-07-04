//
//  IrresistableMovies_TestEnums.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestEnums: XCTestCase {
    
    func testEnums() {

        checkIntValue(Height.poster.rawValue, 200)
        checkIntValue(Height.detailView.rawValue, 500)
        checkIntValue(Height.oneElement.rawValue, 50)
            
        checkIntValue(Height.zero.rawValue, 0)
        checkIntValue(Category.popularMovies.rawValue, 1)
        checkIntValue(Category.upcomingMovies.rawValue, 2)
        checkIntValue(Category.searchedMovies.rawValue, 3)
        
       checkStringValue(Route.segueToSearchViewController.rawValue, "segueToSearchViewController")
       checkStringValue(Route.segueToDetailViewController.rawValue, "segueToDetailViewController")
       checkStringValue(Route.segueToMovieDetailController.rawValue, "segueToMovieDetailController")
       checkStringValue(Route.segueToTrailerDetailController.rawValue, "segueToTrailerDetailController")
        
        checkStringValue(NibName.movieInfoCell.rawValue, "MovieInfoCell")
        checkStringValue(NibName.movieDetailInfoCell.rawValue, "MovieDetailInfoCell")
        checkStringValue(NibName.horizontalScrollingCell.rawValue, "HorizontalScrollingCell")
        checkStringValue(NibName.posterDisplayCell.rawValue, "PosterDisplayCell")
        checkStringValue(NibName.buttonCell.rawValue, "ButtonCell")
        checkStringValue(NibName.labelCell.rawValue, "LabelCell")
        checkStringValue(NibName.collectionViewCell.rawValue, "CollectionViewCell")
        checkStringValue(NibName.multipleCategoriesCell.rawValue, "MultipleCategoriesCell")
        
        checkStringValue(Constants.baseUrl.rawValue, "https://api.themoviedb.org/3")
        
        checkStringValue(Constants.imageFormatterBaseUrl.rawValue, "https://image.tmdb.org/t/p/w")
        checkStringValue(Constants.imdbUrl.rawValue,  "http://m.imdb.com/title/")
        checkStringValue(Constants.apiKey.rawValue, "api_key=56a29f6d7010284157af93df3083d395")
        checkStringValue(Constants.urlPostFix.rawValue, "&language=en-US&page=")
        checkStringValue(Constants.dateFormat.rawValue, "yyyy-mm-dd")
        checkStringValue(Constants.desiredDateFormat.rawValue, "MMM d, yyyy")
        checkStringValue(Constants.dateFormatter.rawValue, "en_US_POSIX")
        checkStringValue(Constants.popularMoviesPageCounter.rawValue, "popularMoviesPageCounter")
        checkStringValue(Constants.topRatedMoviesPageCounter.rawValue, "topRatedMoviesPageCounter")
        checkStringValue(Constants.upcomingMoviesPageCounter.rawValue, "upcomingMoviesPageCounter")
        checkStringValue(Constants.searchMoviesPageCounter.rawValue, "searchMoviesPageCounter")
        checkStringValue(Constants.watchTrailer.rawValue, "Watch Movie Trailer")
        checkStringValue(Constants.homePage.rawValue, "Home Page: ")

        checkStringValue(Endpoint.topRatedMovies.rawValue, "/movie/top_rated?")
        checkStringValue(Endpoint.popularMovies.rawValue, "/movie/popular?")
        checkStringValue(Endpoint.upcomingMovies.rawValue, "/movie/upcoming?")
        checkStringValue(Endpoint.searchUrl.rawValue, "/search/movie?")
        checkStringValue(Endpoint.movieDetail.rawValue, "/movie/")
       
    }
    
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
}
