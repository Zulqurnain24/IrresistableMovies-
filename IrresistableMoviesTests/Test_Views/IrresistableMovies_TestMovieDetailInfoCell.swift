//
//  IrresistableMovies_TestMovieDetailInfoCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestMovieDetailInfoCell: XCTestCase {
    
    let movieDetailInfoCell = Bundle.main.loadNibNamed("MovieDetailInfoCell", owner: self, options: nil)?.last as! MovieDetailInfoCell
    
    func testHorizontalScrollingCell() {
        movieDetailInfoCell.awakeFromNib()
        movieDetailInfoCell.populate(title:  "The Water Diviner", originalTitle: "The Water Diviner", tagLine: "To honour a promise. To find his sons. To make his peace.", overView: "In 1919, Australian farmer Joshua Connor travels to Turkey to discover the fate of his three sons, reported missing in action. Holding on to hope, Joshua must travel across the war-torn landscape to find the truth and his own peace.", voteAverage: "6.8", voteCount: "684", budget: "22500000", revenue: "15520023", rated: "9.821", releaseDate: "2002-10-09")
        checkStringValue(movieDetailInfoCell.budgetLabel.text!, "22500000")
        checkStringValue(movieDetailInfoCell.originalTitleLabel.text!, "The Water Diviner")
        checkStringValue(movieDetailInfoCell.overviewLabel.text!,  "In 1919, Australian farmer Joshua Connor travels to Turkey to discover the fate of his three sons, reported missing in action. Holding on to hope, Joshua must travel across the war-torn landscape to find the truth and his own peace.")
        checkStringValue(movieDetailInfoCell.ratedLabel.text!, "9.821")
        checkStringValue(movieDetailInfoCell.revenueLabel.text!, "15520023")
        checkStringValue(movieDetailInfoCell.titleLabel.text!, "The Water Diviner")
        checkStringValue(movieDetailInfoCell.voteCountLabel.text!, "684")
        checkStringValue(movieDetailInfoCell.voteAverageLabel.text!, "6.8")
         checkStringValue(movieDetailInfoCell.budgetLabel.text!, "22500000")
    }
    
    // MARK: - private tests

    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
