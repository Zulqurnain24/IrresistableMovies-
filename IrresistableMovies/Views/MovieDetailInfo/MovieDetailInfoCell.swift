//
//  MovieDetailInfoCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class MovieDetailInfoCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieDetailInfoCell"
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!

    @IBOutlet weak var releaseDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         self.accessibilityIdentifier = "MovieDetailInfoCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(title: String, originalTitle: String, tagLine: String, overView: String, voteAverage: String, voteCount: String, budget: String, revenue: String, rated: String, releaseDate: String) {
        titleLabel.text  = title
        originalTitleLabel.text = originalTitle
        tagLineLabel.text = tagLine
        overviewLabel.text = overView
        voteAverageLabel.text = voteAverage
        voteCountLabel.text = voteCount
        budgetLabel.text = budget
        revenueLabel.text = revenue
        ratedLabel.text = rated
        releaseDateLabel.text = releaseDate
    }
}
