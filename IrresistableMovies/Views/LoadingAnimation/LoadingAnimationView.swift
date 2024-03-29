//
//  LoadingAnimationView.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class LoadingAnimationView: UIImageView {

    var duration = 3.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let imgListArray :NSMutableArray = []
        for countValue in 1...11
        {
            
            guard let strImageName = "reel_\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        
        self.animationImages = imgListArray as? [UIImage];
        self.animationDuration = duration
    }
    
    func initiateAnimation( _ completionHandler: (() -> Void)? = nil) {
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
            self.stopAnimating()
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
    
}
