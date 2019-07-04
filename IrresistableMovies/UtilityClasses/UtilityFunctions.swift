//
//  UtilityFunctions.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

class UtilityFunctions {
    
    static let shared = UtilityFunctions()

    //for date formatting
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: Constants.dateFormatter.rawValue) // set locale to reliable US_POSIX
        dateFormatter.dateFormat = Constants.dateFormat.rawValue
        guard let dateString = dateString as String?, !dateString.isEmpty,
              let date = dateFormatter.date(from: dateString) else { return "" }
        dateFormatter.dateFormat = Constants.desiredDateFormat.rawValue ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        guard let stringValue = dateFormatter.string(from: date) as String? else { return "" }
        return stringValue
    }
    
    //for generating poster image url
    func generateImageUrl(imageSize: Int, endPoint: String) -> String {
        return "\(Constants.imageFormatterBaseUrl.rawValue)\(imageSize)\(endPoint)"
    }
    
    //for generating imdb movie trailer url
    func generateIMDBMovieTrailerUrl(movieId: String) -> String {
        return "\(Constants.imdbUrl.rawValue)\(movieId)/videogallery"
    }
    
    //for generating movie detail url
    func generateMovieDetailUrl(movieId: String) -> String {
        return "\(Constants.baseUrl.rawValue)\(Endpoint.movieDetail.rawValue)\(movieId)?\(Constants.apiKey.rawValue)"
    }

    //for generating the movie categories respective urls
    func generateTheMovieDBUrl(category: Category, searchTerm: String? = nil, page: Int) -> String? {

        switch category.rawValue {
        case 0:
            return "\(Constants.baseUrl.rawValue)\(Endpoint.topRatedMovies.rawValue)\(Constants.apiKey.rawValue)\(Constants.urlPostFix.rawValue)\(page)"
        case 1:
             return "\(Constants.baseUrl.rawValue)\(Endpoint.popularMovies.rawValue)\(Constants.apiKey.rawValue)\(Constants.urlPostFix.rawValue)\(page)"
        case 2:
             return "\(Constants.baseUrl.rawValue)\(Endpoint.upcomingMovies.rawValue)\(Constants.apiKey.rawValue)\(Constants.urlPostFix.rawValue)\(page)"
        default:
            guard let searchTerm = searchTerm as String? else { return nil }
            return "\(Constants.baseUrl.rawValue)\(Endpoint.searchUrl.rawValue)query=\(searchTerm)&\(Constants.apiKey.rawValue)\(Constants.urlPostFix.rawValue)\(page)"
        }

    }
    
    //URL string encoding
    func performPercentEncoding(originalString: String) -> String {
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        return escapedString
    }
   
}
