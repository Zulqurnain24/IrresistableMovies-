//
//  JSONDecodable.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 30/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init?(json: [String: Any])
}

