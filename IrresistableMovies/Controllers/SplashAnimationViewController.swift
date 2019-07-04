//
//  ViewController.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 29/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SplashAnimationViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    
    let loadingAnimationView = Bundle.main.loadNibNamed("LoadingAnimationView", owner: self, options: nil)?.last as! LoadingAnimationView
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       animationView.addSubview(loadingAnimationView)
        loadingAnimationView.initiateAnimation({
            self.performSegueToSearchViewController()
        })
    }
    
    func performSegueToSearchViewController() {
        performSegue(withIdentifier: Route.segueToSearchViewController.rawValue, sender: self)
    }

}

