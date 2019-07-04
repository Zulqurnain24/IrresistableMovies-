//
//  SearchResultsDataSource.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
   
    private var topRatedMovies = [MovieInfo]()
    private var popularMovies = [MovieInfo]()
    private var upcomingMovies = [MovieInfo]()
    private var searchedMovies = [MovieInfo]()
    private var selectedCategory = Category.searchedMovies
    var reachability = try! Reachability()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategory(category: selectedCategory).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoCell", for: indexPath) as! MovieInfoCell
        guard let datasource = selectedCategory(category: selectedCategory) as [MovieInfo]?, let count = datasource.count as Int?, indexPath.row < count else { return MovieInfoCell() }
        let movieInfoCellViewModel = MovieInfoCellViewModel(movie: selectedCategory(category: selectedCategory)[indexPath.row])
        cell.populate(movieTitle: movieInfoCellViewModel.title, movieImageUrlString: movieInfoCellViewModel.imageUrl, popularity: movieInfoCellViewModel.popularity, voteCount: movieInfoCellViewModel.votes, overView: movieInfoCellViewModel.overView)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func selectedCategory(category: Category) -> [MovieInfo] {
        selectedCategory = category
        switch category {
        case .popularMovies:
            return popularMovies
        case .topRatedMovies:
            return topRatedMovies
        case .upcomingMovies:
            return upcomingMovies
        case .searchedMovies:
            return searchedMovies
        }
    }

    func clearSearchDatasource() {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.searchedMovies.removeAll()
        }
    }
    
    func update(with movies: [MovieInfo]?, selectedCategory: Category, _ completionHandler: (() -> Void)? = nil) -> SearchResultsDataSource? {

        guard let moviesArray = movies as [MovieInfo]? else { return nil }
        
        guard let category = selectedCategory as Category? else { return self }
        self.selectedCategory = category
    
        switch self.selectedCategory {
        case .popularMovies:
            popularMovies.append(contentsOf: moviesArray)
            
            if !popularMovies.isEmpty {
                //save movies datasource to the persistent store
                PersistenceStore.shared.save(catagory: selectedCategory, movieInfos: popularMovies, completionHandler)
            }
            return self
        case .topRatedMovies:
            topRatedMovies.append(contentsOf: moviesArray)
            
            if !topRatedMovies.isEmpty {
                //save movies datasource to the persistent store
                PersistenceStore.shared.save(catagory: selectedCategory, movieInfos: topRatedMovies, completionHandler)
            }
            return self
        case .upcomingMovies:
            upcomingMovies.append(contentsOf: moviesArray)
            
             if !upcomingMovies.isEmpty {
                //save movies datasource to the persistent store
                PersistenceStore.shared.save(catagory: selectedCategory, movieInfos: upcomingMovies, completionHandler)
            }
            return self
        case .searchedMovies:

            if completionHandler != nil {
                completionHandler!()
            }
            
            searchedMovies.append(contentsOf: moviesArray)
            
            guard reachability.connection != .unavailable else {
                return self}
            
             if !upcomingMovies.isEmpty {
                //save movies datasource to the persistent store
                PersistenceStore.shared.save(catagory: selectedCategory, movieInfos: upcomingMovies, completionHandler)
            }
            return self
        }
    }
}
