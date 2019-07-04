//
//  PersistenceStore.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import CoreData

class PersistenceStore {
    
    static let shared = PersistenceStore()
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    func userDefaultSet(key: String, value: Any?) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func userDefaultGet(key: String) -> Any? {
        let string = UserDefaults.standard.integer(forKey: key)
        return string
    }

    func fetchMovieInfos(catagory: Category, withSearchSting: String? = nil) -> [MovieInfo] {
        var movieInfo = [MovieInfo]()
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            let movies = try managedObjectContext.fetch(request)
            movies.forEach({ movie in
                movieInfo.append(MovieInfo(id: Int(movie.id), title: movie.title ?? "", overView: movie.overView ?? "", imageUrl: movie.imageUrl ?? "", popularity: movie.popularity , votes: Int(movie.votes), category: Int(movie.category)))
            })
            
            guard withSearchSting == nil else {
                return Array(Set<MovieInfo>(catagory == Category.searchedMovies ? movieInfo : movieInfo.filter({$0.category == catagory.rawValue}))).filter({ $0.title.contains(withSearchSting!)})
            }
            
            return Array(Set<MovieInfo>(catagory == Category.searchedMovies ? movieInfo : movieInfo.filter({$0.category == catagory.rawValue})))
        } catch let error {
            print("error : \(error.localizedDescription)")
        }
       return []
    }
    
    func save(catagory: Category, movieInfos: [MovieInfo], _ completionHandler: (() -> Void)? = nil) {
        movieInfos.forEach({ movieInfoElement in
            let movieInfo = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: self.managedObjectContext) as! Movie
            movieInfo.category = Int16(movieInfoElement.category)
            movieInfo.id = Int32(movieInfoElement.id)
            movieInfo.imageUrl = movieInfoElement.imageUrl
            movieInfo.popularity = movieInfoElement.popularity
            movieInfo.title = movieInfoElement.title
            movieInfo.overView = movieInfoElement.overView
            movieInfo.votes = Int32(movieInfoElement.votes)
            
            //save to the persistent store
            self.managedObjectContext.saveChanges()
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
    
    func removeAllRecords( _ completionHandler: (() -> Void)? = nil) {
        //save to the persistent store
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try self.managedObjectContext.execute(request)
            guard completionHandler != nil else { return }
            completionHandler!()
        } catch let error {
            print("error: \(error.localizedDescription)")
            completionHandler!()
        }
    }
}
