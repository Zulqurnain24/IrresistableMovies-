//
//  IrresistableMovies_MovieDetailViewControllerUITest.swift
//  IrresistableMoviesUITests
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class IrresistableMovies_MovieDetailViewControllerUITest: XCTestCase {
    
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        
        app = XCUIApplication()
        
        app.launchArguments.append("--uitesting")
        
        app.launch()
    }
    
    // MARK: - Tests
    
    //swipe the table
    func testTapOnMovieCell() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        let movieInfoCell = self.app.otherElements.matching(identifier: "MovieInfoCell").element(boundBy: 0)
        movieInfoCell.tap()

    }

    //tap on home page link cell
    func testTapOnHomepageLinkCell() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(self.app.exists)
        
        let weblinkCell = self.app.otherElements.matching(identifier: "WeblinkCell").element(boundBy: 0)
        weblinkCell.tap()
        
    }
}