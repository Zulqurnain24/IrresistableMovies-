//
//  ImageUtility.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ImageUtility: NSObject {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    static let shared = ImageUtility()
    private override init() {}
    
    var cache: NSCache = NSCache<NSString, UIImage>()
    
    func getData(from string: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let urlString = string as String? else { return }
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: completion).resume()
    }

    func downloadImage(from string: String, completionHandler: @escaping (UIImage) -> Void) {
        if let cachedImage = imageCache.object(forKey: string as NSString) {
            completionHandler(cachedImage)
        } else {
            getData(from: string) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    guard let image = UIImage(data: data) else { return }
                    self.imageCache.setObject(image, forKey: string as NSString)
                    completionHandler(image)
                }
            }
        }
    }
}
