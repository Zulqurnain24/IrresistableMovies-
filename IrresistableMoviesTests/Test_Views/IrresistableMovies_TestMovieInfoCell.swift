//
//  IrresistableMovies_TestMovieInfoCell.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestMovieInfoCell: XCTestCase {
    
    let movieInfoCell = Bundle.main.loadNibNamed("MovieInfoCell", owner: self, options: nil)?.last as! MovieInfoCell
    
    func testMovieInfoCell() {
        movieInfoCell.awakeFromNib()
        movieInfoCell.populate(movieTitle: "Dilwale Dulhania Le Jayenge", movieImageUrlString: Constants.imageFormatterBaseUrl.rawValue + "500" + "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg", popularity: "17.86", voteCount: "13304", overView: "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.")
        checkStringValue(movieInfoCell.movieTitleLabel.text!, "Dilwale Dulhania Le Jayenge")
        checkStringValue(movieInfoCell.movieOverviewLabel.text!, "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.")
        checkStringValue(movieInfoCell.moviePopularityLabel.text!,  "17.86")
        checkStringValue(movieInfoCell.movieVoteCountLabel.text!,  "13304")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {          self.checkUImageValue(self.movieInfoCell.movieImageView.image!,  UIImage(named: "ft8IqAGFs3V7i87z0t0EVRUjK1p.jpg")!)
        }

    }
    
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkUImageValue(_ value: UIImage,  _ actualVal: UIImage) {
        XCTAssertEqual(value, actualVal)
    }
}
