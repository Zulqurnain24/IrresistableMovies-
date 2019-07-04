//
//  IrresistableMovies_TestMovieInfoViewModel.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestMovieInfoCellViewModel: XCTestCase {

    let movieInfoCellViewModel = MovieInfoCellViewModel(movie: Stub.movies.first!)
    
    func testMovieInfoCellViewModel() {
        checkStringValue(movieInfoCellViewModel.imageUrl,  Stub.movies.first!.imageUrl)
        checkStringValue(movieInfoCellViewModel.overView,  "Overview: \n" + Stub.movies.first!.overView)
        checkStringValue(movieInfoCellViewModel.popularity,  "Popularity: \(Stub.movies.first!.popularity) %")
        checkStringValue(movieInfoCellViewModel.title,  Stub.movies.first!.title)
        checkStringValue(movieInfoCellViewModel.votes,  "Votes: \(Stub.movies.first!.votes)")
    }
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
}
