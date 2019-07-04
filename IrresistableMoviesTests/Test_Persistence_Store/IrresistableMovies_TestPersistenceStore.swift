//
//  IrresistableMovies_TestPersistenceStore.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestPersistenceStore: XCTestCase {
    
    func testPersistenceStore() {
        testNSUserDefaults()
        testCoreDataStore()
    }
    
    func testNSUserDefaults() {
        PersistenceStore.shared.userDefaultSet(key: "Counter", value: 1)
        checkIntValue(PersistenceStore.shared.userDefaultGet(key: "Counter") as! Int, 1)
    }
    
    func testCoreDataStore() {
        PersistenceStore.shared.save(catagory: Category.popularMovies, movieInfos: Stub.movies)
        checkMovieInfoArray(Stub.movies, PersistenceStore.shared.fetchMovieInfos(catagory: Category.popularMovies))
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: UIImage,  _ actualVal: UIImage) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkMovieInfoArray(_ value: [MovieInfo], _ actualValue: [MovieInfo]) {
        XCTAssertEqual(value, actualValue)
    }
}
