//
//  Movie+CoreDataProperties.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest(_ searchString: String? = nil) -> NSFetchRequest<Movie> {
        guard searchString == nil else {
            let request = NSFetchRequest<Movie>(entityName: "Movie")
            guard let key = searchString as String? else { return NSFetchRequest<Movie>() }
            let predicate = NSPredicate(format: "title contains[c] %@", key)
            request.predicate = predicate
            return request
        }
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var category: Int16
    @NSManaged public var votes: Int32
    @NSManaged public var popularity: Double
    @NSManaged public var imageUrl: String?
    @NSManaged public var overView: String?
    @NSManaged public var title: String?
    @NSManaged public var id: Int32

}
