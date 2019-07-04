//
//  IrresistableMovies_TestMultipleCategoriesCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestMultipleCategoriesCell: XCTestCase {
    
    let multipleCategoriesCell = Bundle.main.loadNibNamed("MultipleCategoriesCell", owner: self, options: nil)?.last as! MultipleCategoriesCell
    
    
    func testMultipleCategoriesCell() {
       multipleCategoriesCell.awakeFromNib()
       multipleCategoriesCell.label.text = "Hello world"
        checkStringValue(multipleCategoriesCell.label.text!, "Hello world")
        checkStringValue( MultipleCategoriesCell.reuseIdentifier, "MultipleCategoriesCell")
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
