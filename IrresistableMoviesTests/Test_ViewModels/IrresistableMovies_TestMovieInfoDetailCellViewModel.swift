//
//  IrresistableMovies_TestMovieDetailInfoViewModel.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestMovieInfoDetailCellViewModel: XCTestCase {

    let movieInfoDetailCellViewModel = MovieInfoDetailCellViewModel(movieDetailInfo: Stub.movieDetails.first!)
    
    func testMovieInfoCellViewModel() {
        checkStringValue(movieInfoDetailCellViewModel.budget,  "Budget: U$ \(Stub.movieDetails.first!.budget)")
        checkStringValue(movieInfoDetailCellViewModel.homePage,  "\(Stub.movieDetails.first!.homePage)")
        checkStringValue(movieInfoDetailCellViewModel.imageURLString,  "\(Constants.imageFormatterBaseUrl.rawValue)300\(Stub.movieDetails.first!.imageEndpointString)")
        checkStringValue(movieInfoDetailCellViewModel.votes,  "Votes: \(Stub.movieDetails.first!.votes)")
        checkStringValue(movieInfoDetailCellViewModel.imdbId,  Stub.movieDetails.first!.imdbId)
        checkStringValue(movieInfoDetailCellViewModel.isAdult,  "\(Stub.movieDetails.first!.isAdult ? "Parental Guidance Required: Yes" : "Parental Guidance Required: No")")
        checkStringValue(movieInfoDetailCellViewModel.originalTitle,  "Original Title: " + Stub.movieDetails.first!.originalTitle)
        checkStringValue(movieInfoDetailCellViewModel.overview,  "Overview: " + Stub.movieDetails.first!.overview)
        checkStringValue(movieInfoDetailCellViewModel.popularity,  "Popularity: \(Stub.movieDetails.first!.popularity) %")
    }
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
