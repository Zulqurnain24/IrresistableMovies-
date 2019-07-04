//
//  Movie.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 29/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//MovieInfo class
class MovieInfo:  NSObject, JSONDecodable {
    let id: Int
    let title: String
    let overView: String
    let imageUrl: String
    let popularity: Double
    let votes: Int
    let category: Int

    required init?(json: [String : Any]) {
        guard let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let overView = json["overview"] as? String,
            let imageUrl = json["poster_path"] as? String,
            let popularity = json["popularity"] as? Double,
            let votes = json["vote_count"] as? Int,
            let category = json["category"] as? Int else { return nil }
        self.id = id
        self.title = title
        self.overView = overView
        self.imageUrl = imageUrl
        self.popularity = popularity
        self.votes = votes
        self.category = category
    
    }
    
    init( id: Int, title: String, overView: String, imageUrl: String, popularity: Double, votes: Int, category: Int) {
        self.id = id
        self.title = title
        self.overView = overView
        self.imageUrl = imageUrl
        self.popularity = popularity
        self.votes = votes
        self.category = category
    }
    
}
