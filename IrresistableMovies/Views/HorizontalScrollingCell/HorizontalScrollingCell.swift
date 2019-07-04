//
//  HorizontalScrollingCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class HorizontalScrollingCell: UITableViewCell {

    static let reuseIdentifier = "HorizontalScrollingCell"
    
    @IBOutlet weak var horizontalTableView: UITableView!
    
    var categoryDatasource = [String]()
    
    var storedOffsets = [Int: CGFloat]()
    
    private struct Constants {
        static let cellHeight: CGFloat = 30
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
    }

    func registerCell() {
         horizontalTableView.register(UINib(nibName: NibName.collectionViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
    
    func populate(categoryDatasource: [String], completionHandler: (() -> Void)? = nil) {
        self.categoryDatasource.append(contentsOf: categoryDatasource)
        horizontalTableView.reloadData()
        guard completionHandler != nil else { return }
        completionHandler!()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HorizontalScrollingCell: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewCell.reuseIdentifier) as! CollectionViewCell? else { return CollectionViewCell() }
         cell.collectionView.register(UINib(nibName: NibName.multipleCategoriesCell.rawValue, bundle: nil), forCellWithReuseIdentifier: MultipleCategoriesCell.reuseIdentifier)
         cell.collectionView.dataSource = self
         cell.collectionView.delegate = self
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Height.oneElement.rawValue)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
}

extension HorizontalScrollingCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard categoryDatasource.count > 0, indexPath.item < categoryDatasource.count else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleCategoriesCell.reuseIdentifier, for: indexPath) as! MultipleCategoriesCell
        
        cell.label.text = categoryDatasource[indexPath.item]
        cell.label.lineBreakMode = .byWordWrapping
        cell.sizeToFit()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

