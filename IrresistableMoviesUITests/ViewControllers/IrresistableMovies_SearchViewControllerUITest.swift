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
        
        //launch app
        app.launch()
    }
    
    //test swipe On map
    func testTapOnSearchBar() {

        XCTAssertTrue(self.app.exists)
        // Make sure we're displaying onboarding
        let app = XCUIApplication()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            app.tables.searchFields["Search"].tap()
            app.searchFields["Search"].typeText("FlyBoys")
            app.searchFields["Search"].buttons.firstMatch.tap()
        }
    
    }
    
    //test tap on right button
    func testTapOnUISegmentControl() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let categorySegmentControl = self.app.otherElements.matching(identifier: "categorySegmentControl").element(boundBy: 0)
            categorySegmentControl.tap()
        }
        
    }
    
    // MARK: - Tests
    
    //test swipe On map
    func testSwipeOnSearchTableView() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let tableView = self.app.otherElements.matching(identifier: "SearchTableView").element(boundBy: 0)
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
        }
    }
    
    //test swipe On map
    func testTapOnMovieCell() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let tablesQuery = self.app.tables
            
            let cellQuery = tablesQuery.cells.containing(.staticText, identifier: "MovieInfoCell")
            
            let cell = cellQuery.children(matching: .staticText)
            
            let cellElement = cell.element
            
            cellElement.tap()
        }
    }
    
}
