//
//  IrresistableMovies_TestHorizontalScrollingCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestHorizontalScrollingCell: XCTestCase {
    
    let horizontalScrollingCell = Bundle.main.loadNibNamed("HorizontalScrollingCell", owner: self, options: nil)?.last as! HorizontalScrollingCell
    
    func testHorizontalScrollingCell() {
        horizontalScrollingCell.awakeFromNib()
        horizontalScrollingCell.categoryDatasource = ["Action", "Suspense", "Romance", "Comedy"]
        checkStringValue( horizontalScrollingCell.reuseIdentifier!, "PosterDisplayCell")
        checkIntValue(horizontalScrollingCell.categoryDatasource.count, 4)
        checkStringValue(horizontalScrollingCell.categoryDatasource[0], "Action")
        checkStringValue(horizontalScrollingCell.categoryDatasource[1], "Suspense")
        checkStringValue(horizontalScrollingCell.categoryDatasource[2], "Romance")
        checkStringValue(horizontalScrollingCell.categoryDatasource[3], "Comedy")
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
