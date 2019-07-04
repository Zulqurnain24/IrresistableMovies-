//
//  IrresistableMovies_TestImageUtility.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestImageUtility: XCTestCase {
    
    func testUtilityFunction() {
        testDownloadImage()
    }
    
    func testDownloadImage() {
        ImageUtility.shared.downloadImage(from: Constants.imageFormatterBaseUrl.rawValue + "500" + "/ft8IqAGFs3V7i87z0t0EVRUjK1p.jpg", completionHandler: { image in
            XCTAssertEqual(image, UIImage(named: "ft8IqAGFs3V7i87z0t0EVRUjK1p.jpg"))
        })
    }

}
