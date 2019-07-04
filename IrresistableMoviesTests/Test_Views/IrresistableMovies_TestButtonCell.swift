//
//  IrresistableMovies_TestButtonCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestButtonCell: XCTestCase {
    
    let buttonCell = Bundle.main.loadNibNamed("ButtonCell", owner: self, options: nil)?.last as! ButtonCell
    
    func testButtonCell() {
        buttonCell.awakeFromNib()
        buttonCell.button.setTitle("Hello world", for: .normal)
        checkStringValue((buttonCell.button.titleLabel?.text!)!, "Hello world")
        checkStringValue( buttonCell.reuseIdentifier!, "ButtonCell")
    }
    
    // MARK: - private tests

    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
