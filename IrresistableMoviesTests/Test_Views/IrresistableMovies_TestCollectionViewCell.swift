//
//  IrresistableMovies_TestCollectionViewCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestCollectionViewCell: XCTestCase {
    
    let collectionViewCell = Bundle.main.loadNibNamed("CollectionViewCell", owner: self, options: nil)?.last as! CollectionViewCell
    
    func testCollectionViewCell() {
       collectionViewCell.awakeFromNib()
       checkStringValue( CollectionViewCell.reuseIdentifier, "CollectionViewCell")
    }
    
    // MARK: - private tests

    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
