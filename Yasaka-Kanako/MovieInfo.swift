//
//  MovieInfo.swift
//  Yasaka-Kanako
//
//  Created by txx on 12/02/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Foundation

class MovieInfo: CustomStringConvertible {
    var name: String? = ""
    var director: String? = ""
    var thumbImage: String? = ""
    var score: String? = ""
    var url: String? = ""
    
    public var description: String {
        get
        {
            return "name=\(name)\n director=\(director)\nthumbImage=\(thumbImage)\nscore=\(score)\nurl=\(url)"
        }
    }
}
