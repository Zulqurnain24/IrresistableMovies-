//
//  IrresistableMovies_SearchViewControllerUITest.swift
//  IrresistableMoviesUITests
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class IrresistableMovies_SearchViewControllerUITest: XCTestCase {

    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        
        app = XCUIApplication()
        
        app.launchArguments.append("--uitesting")
        
    }
    
    //test swipe On map
    func testTapOnSearchBar() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        let searchBar = app.otherElements.matching(identifier: "searchBar").element(boundBy: 0)
        searchBar.tap()
        
    }
    
    //test tap on right button
    func testTapOnUISegmentControl() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        let categorySegmentControl = app.otherElements.matching(identifier: "categorySegmentControl").element(boundBy: 0)
        categorySegmentControl.tap()
        
    }
    
    // MARK: - Tests
    
    //test swipe On map
    func testSwipeOnSearchTableView() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        let tableView = app.otherElements.matching(identifier: "SearchTableView").element(boundBy: 0)
        tableView.swipeUp()
        tableView.swipeUp()
        tableView.swipeUp()
    }
    
    //test swipe On map
    func testTapOnMovieCell() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)

        let tableViewCell = app.otherElements.matching(identifier: "MovieInfoCell").element(boundBy: 0)
        tableViewCell.tap()
        
    }
    
}
