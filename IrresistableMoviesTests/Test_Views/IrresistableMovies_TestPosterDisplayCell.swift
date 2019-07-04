//
//  IrresistableMovies_TestPosterDisplayCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestPosterDisplayCell: XCTestCase {
    
    let posterDisplayCell = Bundle.main.loadNibNamed("PosterDisplayCell", owner: self, options: nil)?.last as! PosterDisplayCell
    
    func testPosterDisplayCell() {
        posterDisplayCell.awakeFromNib()
        checkStringValue( posterDisplayCell.reuseIdentifier!, "PosterDisplayCell")
    }
    
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
