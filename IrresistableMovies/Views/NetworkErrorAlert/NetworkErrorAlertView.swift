//
//  NetworkErrorAlertView.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class NetworkErrorAlertView: UIView {
    
    var buttonCallback: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        guard let completionHandler = buttonCallback as (()->Void)? else { return }
        completionHandler()
    }

}
