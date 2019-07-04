//
//  MovieDetailTableTableViewController.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class MovieDetailTableViewController: UITableViewController {

    lazy var dataSource: MovieDetailInfo! = nil
    let networkErrorAlertView = Bundle.main.loadNibNamed("NetworkErrorAlertView", owner: self, options: nil)?.last as! NetworkErrorAlertView
    
    lazy var movieInfoDetailCellViewModel: MovieInfoDetailCellViewModel! = nil
    let client = IrresistableMoviesAPIClient()
    var reachability = try! Reachability()
    var movieId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "MovieDetailTableView"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NibName.posterDisplayCell.rawValue, bundle: nil), forCellReuseIdentifier: PosterDisplayCell.reuseIdentifier)
        tableView.register(UINib(nibName: NibName.movieDetailInfoCell.rawValue, bundle: nil), forCellReuseIdentifier: MovieDetailInfoCell.reuseIdentifier)
        tableView.register(UINib(nibName: NibName.horizontalScrollingCell.rawValue, bundle: nil), forCellReuseIdentifier: HorizontalScrollingCell.reuseIdentifier)
        tableView.register(UINib(nibName: NibName.buttonCell.rawValue, bundle: nil), forCellReuseIdentifier: ButtonCell.reuseIdentifier)
        
        fetchMovieDetail()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard !reachability.notifierRunning else { return }
        do {
            try reachability.startNotifier()
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func fetchMovieDetail() {
        guard let movieIdValue = movieId as Int? else { return }
        client.fetchMovieDetails(movieId: "\(movieIdValue)") { movies, error in
            guard error == nil else { return }
            self.dataSource = movies
            self.movieInfoDetailCellViewModel   = MovieInfoDetailCellViewModel(movieDetailInfo: self.dataSource)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Route.segueToTrailerDetailController.rawValue {
            let destinationVC = segue.destination as! MovieTrailerController
            guard let urlString = UtilityFunctions.shared.generateIMDBMovieTrailerUrl(movieId:  movieInfoDetailCellViewModel.imdbId) as String? else { return }
            destinationVC.trailerURLString = urlString
        }
    }
    
    //for displaying alertview
    func showAlert() {
        let windows = UIApplication.shared.windows
        let lastWindow = windows.last
        networkErrorAlertView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width/8, y: UIScreen.main.bounds.size.height/8), size: CGSize(width: 0.8 * UIScreen.main.bounds.size.width, height:  0.5 * UIScreen.main.bounds.size.height))
        networkErrorAlertView.buttonCallback = {
            self.removeAlert()
        }
        lastWindow?.addSubview(networkErrorAlertView)
    }
    
    func removeAlert() {
        networkErrorAlertView.removeFromSuperview()
    }
}

extension MovieDetailTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieDetailCellCategory.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard movieInfoDetailCellViewModel != nil else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            let posterDisplayCell = tableView.dequeueReusableCell(withIdentifier: PosterDisplayCell.reuseIdentifier, for: indexPath) as! PosterDisplayCell
            guard let imageURLString =  movieInfoDetailCellViewModel.imageURLString as String? else { return UITableViewCell()}
            posterDisplayCell.populate(posterImageUrlString: imageURLString)
            return posterDisplayCell
        case 1:
            //for genres
            let horizontalScrollingCell = tableView.dequeueReusableCell(withIdentifier: HorizontalScrollingCell.reuseIdentifier, for: indexPath) as! HorizontalScrollingCell
            horizontalScrollingCell.categoryDatasource.append("Genre: ")
            guard let genreArray = movieInfoDetailCellViewModel?.genres.compactMap ({
                return ($0 as! Dictionary<String, Any>)["name"]
            }) as! [String]? else { return UITableViewCell() }
            horizontalScrollingCell.populate(categoryDatasource: genreArray, completionHandler: {
                let indexPath = NSIndexPath(row: indexPath.row, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
            })
            return horizontalScrollingCell
        case 2:
            let movieDetailInfoCell = tableView.dequeueReusableCell(withIdentifier: MovieDetailInfoCell.reuseIdentifier, for: indexPath) as! MovieDetailInfoCell
            movieDetailInfoCell.populate(title: movieInfoDetailCellViewModel.title, originalTitle: movieInfoDetailCellViewModel.originalTitle, tagLine: movieInfoDetailCellViewModel.tagLine, overView: movieInfoDetailCellViewModel.overview, voteAverage: movieInfoDetailCellViewModel.voteAverage, voteCount: movieInfoDetailCellViewModel.votes, budget: movieInfoDetailCellViewModel.budget, revenue: movieInfoDetailCellViewModel.revenue, rated: movieInfoDetailCellViewModel.isAdult, releaseDate: movieInfoDetailCellViewModel.releaseDate)
            return movieDetailInfoCell
        case 3:
            //for languages
            let horizontalScrollingCell = tableView.dequeueReusableCell(withIdentifier: HorizontalScrollingCell.reuseIdentifier, for: indexPath) as! HorizontalScrollingCell
            horizontalScrollingCell.categoryDatasource.append("Languages: ")
            guard let languagesArray = movieInfoDetailCellViewModel?.spokenLanguages.compactMap ({
                return ($0 as! Dictionary<String, Any>)["name"]
            }) as! [String]? else { return UITableViewCell() }
            horizontalScrollingCell.populate(categoryDatasource: languagesArray, completionHandler: {
                let indexPath = NSIndexPath(row: indexPath.row, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
            })
            return horizontalScrollingCell
        case 4:
            //for production companies
            let horizontalScrollingCell = tableView.dequeueReusableCell(withIdentifier: HorizontalScrollingCell.reuseIdentifier, for: indexPath) as! HorizontalScrollingCell
            horizontalScrollingCell.categoryDatasource.append("Production: ")
            guard let productionCompaniesArray = movieInfoDetailCellViewModel?.productionCompanies.compactMap ({
                return ($0 as! Dictionary<String, Any>)["name"]
            }) as! [String]? else { return UITableViewCell() }
            horizontalScrollingCell.populate(categoryDatasource: productionCompaniesArray, completionHandler: {
                let indexPath = NSIndexPath(row: indexPath.row, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
            })
            return horizontalScrollingCell
        case 5:
            //for weblink
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as! ButtonCell
            buttonCell.button.setTitle(movieInfoDetailCellViewModel.homePage, for: .normal)
            buttonCell.button.titleLabel?.sizeToFit()
            buttonCell.setNeedsDisplay()
            buttonCell.buttonCallback = {
                DispatchQueue.main.async {
                    guard let url = URL(string: self.movieInfoDetailCellViewModel.homePage), self.reachability.connection != .unavailable else {
                        self.showAlert()
                        return }
                    UIApplication.shared.open(url)
                }
            }
            buttonCell.accessibilityIdentifier = "WeblinkCell"
            return buttonCell
        case 6:
            //for trailer
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as! ButtonCell
            buttonCell.button.setTitle(Constants.watchTrailer.rawValue, for: .normal)
            buttonCell.button.titleLabel?.sizeToFit()
            buttonCell.setNeedsDisplay()
            buttonCell.buttonCallback = {
                DispatchQueue.main.async {
                    guard self.reachability.connection != .unavailable else {
                        self.showAlert()
                        return
                    }
                    self.performSegue(withIdentifier: Route.segueToTrailerDetailController.rawValue, sender: self)
                }
            }
            buttonCell.accessibilityIdentifier = "TrailerCell"
            return buttonCell
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            //height for image poster
            return CGFloat(Height.poster.rawValue)
        case 1:
            //height for one element
            return CGFloat(Height.oneElement.rawValue)
        case 2:
            //for detail
            return CGFloat(Height.detailView.rawValue)
        case 3:
            //height for one element
            return CGFloat(Height.oneElement.rawValue)
        case 4:
            //height for one element
            return CGFloat(Height.oneElement.rawValue)
        case 5:
            //height for one element
            return CGFloat(Height.oneElement.rawValue)
        case 6:
            //height for one element
            return CGFloat(Height.oneElement.rawValue)
        default:
            break
        }
        return 0
    }
}
