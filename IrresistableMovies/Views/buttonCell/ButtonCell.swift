//
//  ButtonCell.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
    
    static let reuseIdentifier = "ButtonCell"
    
    @IBOutlet weak var button: UIButton!
    
    var buttonCallback: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populateTitle(title: String, completionHandler: (() -> Void)? = nil) {
        button.titleLabel?.text = title
        guard completionHandler != nil else { return }
        completionHandler!()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let completionHandler = buttonCallback as (()->Void)? else { return }
        completionHandler()
    }
}
