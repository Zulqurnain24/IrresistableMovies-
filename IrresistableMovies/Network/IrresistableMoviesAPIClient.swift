//
//  IrresistableMoviesAPIClient.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

class IrresistableMoviesAPIClient {
    let downloader = JSONDownloader()
    
    func fetchMovies(category: Category, searchTerm: String? = nil, completionHandler: @escaping ([MovieInfo], IrresistableMoviesError?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var counter = 1

            switch category {
            case .popularMovies:
                if let popularMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.popularMoviesPageCounter.rawValue) as! Int? {
                    counter = popularMoviesPageCounter <= 0 ? 1 : popularMoviesPageCounter
                } else {
                    PersistenceStore.shared.userDefaultSet(key: Constants.popularMoviesPageCounter.rawValue, value: counter)
                }
            case .topRatedMovies:
                if let topRatedMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.topRatedMoviesPageCounter.rawValue) as! Int? {
                    counter = topRatedMoviesPageCounter <= 0 ? 1 : topRatedMoviesPageCounter
                } else {
                    PersistenceStore.shared.userDefaultSet(key: Constants.topRatedMoviesPageCounter.rawValue, value: counter)
                }
            case .upcomingMovies:
                if let upcomingMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.upcomingMoviesPageCounter.rawValue) as! Int? {
                    counter = upcomingMoviesPageCounter <= 0 ? 1 : upcomingMoviesPageCounter
                } else {
                    PersistenceStore.shared.userDefaultSet(key: Constants.upcomingMoviesPageCounter.rawValue, value: counter)
                }
            default:
                if let searchMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.searchMoviesPageCounter.rawValue) as! Int? {
                    counter = searchMoviesPageCounter <= 0 ? 1 : searchMoviesPageCounter
                } else {
                    PersistenceStore.shared.userDefaultSet(key: Constants.searchMoviesPageCounter.rawValue, value: counter)
                }
            }

            guard let endpoint = UtilityFunctions.shared.generateTheMovieDBUrl(category: category, searchTerm: searchTerm, page: counter),
                  let url = URL(string: endpoint), let uRLRequest = URLRequest(url: url) as URLRequest? else {
                return
            }
            let task = self?.downloader.jsonTask(with: uRLRequest) {json, error in
                DispatchQueue.main.async {
                    guard let json = json else {
                        print("error: \(error.debugDescription)")
                        completionHandler([], error!)
                        return
                    }
                    guard let results = json["results"] as? [[String: Any]], results.count > 0 else {
                        completionHandler([], .jsonParsingFailure(message: "JSON data does not contain results"))
                        return
                    }

                    var resultsCopy = Array<[String: Any]>()
                    resultsCopy.append(contentsOf: results)

                    for i in 0...resultsCopy.count - 1 {
                        resultsCopy[i]["category"] = category.rawValue
                    }

                    let movies = resultsCopy.compactMap { movieInfo -> MovieInfo? in
                        return MovieInfo(json: movieInfo)
                    }
                 
                    completionHandler(movies, nil)
                }
            }
            task?.resume()
        }
    }
    
    
    func fetchMovieDetails(movieId: String, completionHandler: @escaping (MovieDetailInfo?, IrresistableMoviesError?) -> Void) {
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let endpoint = UtilityFunctions.shared.generateMovieDetailUrl(movieId: movieId) as String?,
                let url = URL(string: endpoint), let uRLRequest = URLRequest(url: url) as URLRequest? else {
                    return
            }
            let task = self?.downloader.jsonTask(with: uRLRequest) {json, error in
                DispatchQueue.main.async {
                    guard let json = json else {
                        print("error: \(error.debugDescription)")
                        completionHandler(nil, error!)
                        return
                    }
                    guard let results = json as [String: Any]?, let movieDetailInfo = MovieDetailInfo(json: results) as MovieDetailInfo? else {
                        completionHandler(nil, .jsonParsingFailure(message: "JSON data does not contain results"))
                        return
                    }
                    
                    completionHandler(movieDetailInfo, nil)
                }
            }
            task?.resume()
        }
    }
}
