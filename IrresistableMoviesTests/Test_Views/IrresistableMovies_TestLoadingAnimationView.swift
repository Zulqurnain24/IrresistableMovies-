//
//  IrresistableMovies_TestLoadingAnimationView.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestLoadingAnimationView: XCTestCase {
  
    let loadingAnimationView = Bundle.main.loadNibNamed("LoadingAnimationView", owner: self, options: nil)?.last as! LoadingAnimationView
    
    
    func testLoadingAnimationView() {
        loadingAnimationView.awakeFromNib()
        loadingAnimationView.initiateAnimation({
            print("Animation is finished!")
        })
        checkIntValue(Int(loadingAnimationView.duration), Int(3.0))
        checkIntValue(loadingAnimationView.animationImages!.count, 11)
    }

    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
