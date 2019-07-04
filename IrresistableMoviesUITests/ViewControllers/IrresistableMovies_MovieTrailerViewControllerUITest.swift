//
//  IrresistableMovies_MovieTrailerViewControllerUITest.swift
//  IrresistableMoviesUITests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class IrresistableMovies_MovieTrailerViewControllerUITest: XCTestCase {
    
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
    func testGoToDetailView() {
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let tablesQuery = self.app.tables
            
            let cellQuery = tablesQuery.cells.containing(.staticText, identifier: "MovieInfoCell")
            
            let cell = cellQuery.children(matching: .staticText)
            
            let cellElement = cell.element
            
            cellElement.tap()
        }
        
    }
    
    //tap on home page link cell
    func testTapOnTrailerLinkCell() {
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(self.app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let tablesQuery = self.app.tables
            
            let cellQuery = tablesQuery.cells.containing(.staticText, identifier: "TrailerCell")
            
            let cell = cellQuery.children(matching: .staticText)
            
            let cellElement = cell.element
            
            cellElement.tap()
        }
        
    }
    
    //tap on home page link cell
    func testTapOnWebViewPlayButtonCell() {
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(self.app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            let webView = self.app.otherElements.matching(identifier: "webView").element(boundBy: 0)
            webView.buttons.firstMatch.tap()
        }
        
    }
}
