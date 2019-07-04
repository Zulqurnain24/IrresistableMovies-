//
//  MovieInfoCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class MovieInfoCell: UITableViewCell {

    static let reuseIdentifier = "MovieInfoCell"
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieVoteCountLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.accessibilityIdentifier = "MovieInfoCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(movieTitle: String, movieImageUrlString: String, popularity: String, voteCount: String, overView: String) {
        ImageUtility.shared.downloadImage(from: UtilityFunctions.shared.generateImageUrl(imageSize: 200, endPoint: movieImageUrlString), completionHandler: { image in
            self.movieImageView.image = image
        })
        movieTitleLabel.text = movieTitle
        moviePopularityLabel.text = popularity
        movieVoteCountLabel.text = voteCount
        movieOverviewLabel.text = overView
    }
    
}
