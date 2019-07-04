//
//  TrailerDetailController.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 01/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import WebKit

class MovieTrailerController: UIViewController {

    var trailerURLString: String!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.accessibilityIdentifier = "webView"
        
        guard let urlString = trailerURLString as String? else { return }
        loadUrl(urlString: urlString)
    }

    func loadUrl(urlString: String) {
        guard let url =  URL(string: urlString) as URL? else { return }
        webView.load(URLRequest(url: url))
    }

}
