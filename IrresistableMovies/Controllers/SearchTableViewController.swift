//
//  SearchViewController.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController {

    @IBOutlet weak var categorySegmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    //load respective views from nibs
    let loadingAnimationView = Bundle.main.loadNibNamed("LoadingAnimationView", owner: self, options: nil)?.last as! LoadingAnimationView
    let networkErrorAlertView = Bundle.main.loadNibNamed("NetworkErrorAlertView", owner: self, options: nil)?.last as! NetworkErrorAlertView
    
    let searchController = UISearchController(searchResultsController: nil)
    var dataSource = SearchResultsDataSource()
    let client = IrresistableMoviesAPIClient()
    var reachability = try! Reachability()
    var selectedRow = 0
    
    private struct Measurements {
        static let cellHeight: CGFloat = 170
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorySegmentControl.accessibilityIdentifier = "categorySegmentControl"
        searchController.searchBar.accessibilityIdentifier = "searchBar"
        tableView.accessibilityIdentifier = "SearchTableView"
        searchController.searchBar.delegate = self
        DispatchQueue.main.async {
            self.loadingAnimationView.isHidden = false
            self.loadingAnimationView.startAnimating()
        }
        updateCoreDataRecords({
            DispatchQueue.main.async {
                self.loadingAnimationView.isHidden = true
                self.loadingAnimationView.stopAnimating()
            }
        })
        
        refreshFlags()
        
        setupView()

        fetchResultForCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard !reachability.notifierRunning else { return }
        do {
            try reachability.startNotifier()
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func updateCoreDataRecords(_ completionHandler: (() -> Void)? = nil) {
        guard reachability.connection != .unavailable, completionHandler != nil else { return }
        PersistenceStore.shared.removeAllRecords(completionHandler)
    }
    
    func setupView() {
        loadingAnimationView.isHidden = false
        loadingAnimationView.startAnimating()
        loadingAnimationView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width/4, y: UIScreen.main.bounds.size.height/4), size: CGSize(width: 0.75 * loadingAnimationView.frame.size.width, height: 0.75 * loadingAnimationView.frame.size.height))
        self.view.addSubview(loadingAnimationView)
        self.view.bringSubviewToFront(loadingAnimationView)
        
        guard let searchText = searchController.searchBar.text as String?, searchText.isEmpty, let index = categorySegmentControl.selectedSegmentIndex as Int?,
            let category = Category(rawValue: index) else { return }
        
        tableView.delegate = self
        tableView.dataSource = dataSource.selectedCategory(category: category) as? UITableViewDataSource
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(displayP3Red: 75/255, green: 166/255, blue: 47/255, alpha: 1.0)
        searchController.view.tintColor = UIColor.white
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.register(UINib(nibName: NibName.movieInfoCell.rawValue, bundle: nil), forCellReuseIdentifier: MovieInfoCell.reuseIdentifier)
    }
    
    func refreshFlags() {
        PersistenceStore.shared.userDefaultSet(key: Constants.upcomingMoviesPageCounter.rawValue, value: 1)
        PersistenceStore.shared.userDefaultSet(key: Constants.popularMoviesPageCounter.rawValue, value: 1)
        PersistenceStore.shared.userDefaultSet(key: Constants.upcomingMoviesPageCounter.rawValue, value: 1)
        PersistenceStore.shared.userDefaultSet(key: Constants.searchMoviesPageCounter.rawValue, value: 1)
    }
    
    @IBAction func categorySegmentControlValueChanged(_ sender: UISegmentedControl) {
        fetchResultForCategory()
    }

    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func incrementCurrentCounter() {
        guard let selectedSegment = self.categorySegmentControl.selectedSegmentIndex as Int?, let category = Category(rawValue: selectedSegment) as Category?, let isSearchBarEmpty = searchController.searchBar.text!.isEmpty as Bool?, isSearchBarEmpty else { return }
        switch category {
        case .popularMovies:
            if let popularMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.popularMoviesPageCounter.rawValue) as! Int? {
                var counter = popularMoviesPageCounter
                counter += 1
                PersistenceStore.shared.userDefaultSet(key: Constants.popularMoviesPageCounter.rawValue, value: counter)
            }
        case .topRatedMovies:
            if let popularMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.topRatedMoviesPageCounter.rawValue) as! Int? {
                var counter = popularMoviesPageCounter
                counter += 1
                 PersistenceStore.shared.userDefaultSet(key: Constants.topRatedMoviesPageCounter.rawValue, value: counter)
            }
        case .upcomingMovies:
            if let popularMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.upcomingMoviesPageCounter.rawValue) as! Int? {
                var counter = popularMoviesPageCounter
                counter += 1
                PersistenceStore.shared.userDefaultSet(key: Constants.upcomingMoviesPageCounter.rawValue, value: counter)
            }
        case .searchedMovies:
            if  searchController.searchBar.isFirstResponder,
                let searchMoviesPageCounter = PersistenceStore.shared.userDefaultGet(key: Constants.searchMoviesPageCounter.rawValue) as! Int? {
                var counter = searchMoviesPageCounter
                counter += 1
                PersistenceStore.shared.userDefaultSet(key: Constants.searchMoviesPageCounter.rawValue, value: counter)
            }
        }
    }
    
    func reloadTableView(movies: [MovieInfo], category: Category) {
        DispatchQueue.main.async {
            self.loadingAnimationView.isHidden = false
            self.loadingAnimationView.startAnimating()
        }
        self.tableView.dataSource = self.dataSource.update(with: movies, selectedCategory: category, {
            DispatchQueue.main.async {
                self.loadingAnimationView.isHidden = true
                self.loadingAnimationView.stopAnimating()
            }
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchResultForCategory() {
        loadingAnimationView.isHidden = false
        loadingAnimationView.startAnimating()
        guard let searchText = searchController.searchBar.text as String?, searchText.isEmpty, let index = categorySegmentControl.selectedSegmentIndex as Int?,
            let category = Category(rawValue: index) as Category? else { return }
        guard reachability.connection != .unavailable else {
            if let movies = PersistenceStore.shared.fetchMovieInfos(catagory: category) as [MovieInfo]? {
                DispatchQueue.main.async {
                    self.loadingAnimationView.isHidden = true
                    self.reloadTableView(movies: movies, category: category)
                }
            }
            return
        }
        client.fetchMovies(category: category) { movies, error in
            DispatchQueue.main.async {
                self.loadingAnimationView.isHidden = true
                self.loadingAnimationView.stopAnimating()
                guard error == nil else { return }
                self.reloadTableView(movies: movies, category: category)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        guard reachability.connection != .unavailable else { return }
        if distanceFromBottom < height {
            incrementCurrentCounter()
            fetchResultForCategory()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Route.segueToMovieDetailController.rawValue {
            guard let searchText = searchController.searchBar.text as String?,
                  let index = categorySegmentControl.selectedSegmentIndex as Int?,
                  let category = searchText.isEmpty ? Category(rawValue: index) as Category? : Category.searchedMovies,
                let movies = dataSource.selectedCategory(category: category) as [MovieInfo]? else { return }
            let destinationVC = segue.destination as! MovieDetailTableViewController
            destinationVC.movieId = movies[selectedRow].id
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

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchResultForCategory()
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text as String?, !searchText.isEmpty else { return }
        dataSource.clearSearchDatasource()
        guard reachability.connection != .unavailable else {
            if let movies = PersistenceStore.shared.fetchMovieInfos(catagory: Category.searchedMovies, withSearchSting: searchBar.text) as [MovieInfo]? {
                DispatchQueue.main.async {
                    self.loadingAnimationView.isHidden = true
                    self.reloadTableView(movies: movies, category: Category.searchedMovies)
                }
            }
            return }
        client.fetchMovies(category: Category.searchedMovies, searchTerm:  UtilityFunctions.shared.performPercentEncoding(originalString: searchBar.text ?? "")) { movies, error in
            DispatchQueue.main.async {
                self.loadingAnimationView.isHidden = false
                self.loadingAnimationView.startAnimating()
            }
            self.tableView.dataSource = self.dataSource.update(with: movies, selectedCategory: Category.searchedMovies, {
                DispatchQueue.main.async {
                    self.loadingAnimationView.isHidden = true
                    self.loadingAnimationView.stopAnimating()
                }
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SearchTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard reachability.connection != .unavailable else {
            return }
        dataSource.clearSearchDatasource()
        client.fetchMovies(category: Category.searchedMovies, searchTerm: searchController.searchBar.text) { movies, error in
            self.loadingAnimationView.isHidden = false
            self.loadingAnimationView.startAnimating()
            self.tableView.dataSource = self.dataSource.update(with: movies, selectedCategory: Category.searchedMovies, {
                DispatchQueue.main.async {
                    self.loadingAnimationView.isHidden = true
                    self.loadingAnimationView.stopAnimating()
                }
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SearchTableViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Measurements.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        guard reachability.connection != .unavailable else {
            showAlert()
            return
        }
        performSegue(withIdentifier: Route.segueToMovieDetailController.rawValue, sender: self)
    }
}
