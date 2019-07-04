//
//  IrresistableMovies_TestNetworkErrorAlertView.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestNetworkErrorAlertView: XCTestCase {
 
    let alert = Bundle.main.loadNibNamed("NetworkErrorAlertView", owner: self, options: nil)?.last as! NetworkErrorAlertView
    
    func testNetworkErrorAlertView() {
       alert.awakeFromNib()
       alert.buttonCallback = {    print("NetworkErrorAlertView is working") }
        alert.okButtonAction(self)
    }

}
