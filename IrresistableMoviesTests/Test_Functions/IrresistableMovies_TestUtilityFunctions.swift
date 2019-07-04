//
//  IrresistableMovies_TestUtilityFunctions.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestUtilityFunctions: XCTestCase {
    
    func testUtilityFunction() {
        testFormateDate()
        testGenerateImageUrl()
        testGenerateIMDBMovieTrailerUrl()
        testPerformPercentEncoding()
    }
    
    func testPerformPercentEncoding() {
        let percentEncodingValueTobeChecked = UtilityFunctions.shared.performPercentEncoding(originalString: "John Wick 3 * The ?")
         checkStringValue(percentEncodingValueTobeChecked, "John+Wick+3+%2A+The+%3F")
    }
    
    func testGenerateIMDBMovieTrailerUrl() {
        let imdbUrlValueTobeTested = UtilityFunctions.shared.generateIMDBMovieTrailerUrl(movieId: "tt2011118")
        checkStringValue(imdbUrlValueTobeTested, "http://m.imdb.com/title/tt2011118")
    }
    
    func testGenerateImageUrl() {
        let urlValueToBeChecked = UtilityFunctions.shared.generateImageUrl(imageSize: 500, endPoint: "/ft8IqAGFs3V7i87z0t0EVRUjK1p.jpg")
        checkStringValue(urlValueToBeChecked, "https://image.tmdb.org/t/p/w500/ft8IqAGFs3V7i87z0t0EVRUjK1p.jpg")
    }
    
    func testFormateDate() {
        let timestampLabelString = "2019-03-11T09:31:56Z"
        let value = UtilityFunctions.shared.formatDate(dateString: timestampLabelString)
        checkStringValue(value, "Mar 11, 2019")
    }
   
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
}
