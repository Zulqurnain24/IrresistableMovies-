//
//  IrresistableMovies_TestWebservice.swift
//  IrresistableMoviesTests
//
//  Created by Mohammad Zulqarnain on 04/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import IrresistableMovies

class IrresistableMovies_TestWebservice: XCTestCase {
    let client = IrresistableMoviesAPIClient()
    let downloader = JSONDownloader()
    
    func testWebservice() {
        testWebserviceFortopRatedMovies()
    }
    
    func testWebserviceFortopRatedMovies() {
       
        guard let endpoint = UtilityFunctions.shared.generateTheMovieDBUrl(category: Category.topRatedMovies, page: 1),
            let url = URL(string: endpoint), let uRLRequest = URLRequest(url: url) as URLRequest? else {
                return
        }
        let task = downloader.jsonTask(with: uRLRequest) {json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    print("error: \(error.debugDescription)")
                    return
                }
                //compare stored .json webservice file with the json received
                if let path = Bundle.main.path(forResource: "topRatedMovies.json", ofType: "") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                        if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                            guard let dataItem1 = MovieInfoList(json: jsonResult) as MovieInfoList?, let dataItem2 = MovieInfoList(json: json) as MovieInfoList?  else { return }
                            XCTAssertEqual(dataItem1, dataItem2)
                        }
                    } catch let error {
                        // handle error
                        print("Error : \(error.localizedDescription)")
                    }
                }
                
            }
        }
        task.resume()
    }
    
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
}
