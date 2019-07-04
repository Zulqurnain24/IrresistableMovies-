//
//  LabelCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 02/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
 
    static let reuseIdentifier = "LabelCell"
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
