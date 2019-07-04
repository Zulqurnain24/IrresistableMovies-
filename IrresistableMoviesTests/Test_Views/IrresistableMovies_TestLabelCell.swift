//
//  IrresistableMovies_TestLabelCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestLabelCell: XCTestCase {
    
    let labelCell = Bundle.main.loadNibNamed("labelCell", owner: self, options: nil)?.last as! LabelCell

    func testLabelCell() {
        labelCell.awakeFromNib()
        labelCell.label.text = "Hello world"
        checkStringValue(labelCell.label.text!, "Hello world")
        checkStringValue( labelCell.reuseIdentifier!, "LabelCell")
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
