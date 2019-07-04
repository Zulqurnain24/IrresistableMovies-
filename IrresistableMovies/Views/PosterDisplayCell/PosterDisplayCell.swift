//
//  PosterDisplayCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PosterDisplayCell: UITableViewCell {
    
    static let reuseIdentifier = "PosterDisplayCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    func setupView() {
        posterImageView.frame = self.frame
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(posterImageUrlString: String) {
        ImageUtility.shared.downloadImage(from: posterImageUrlString, completionHandler: { image in
            self.posterImageView.image = image
        })
    }
}
