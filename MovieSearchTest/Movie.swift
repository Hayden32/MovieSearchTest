//
//  Movie.swift
//  MovieSearchTest
//
//  Created by Hayden Hastings on 2/24/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class Movie {
    
    private let origianlTitleKey = "original_title"
    private let releaseDateKey = "release_date"
    private let overviewKey = "overview"
    private let posterURLStringKey = "poster_path"
    private let idKey = "id"
    
    let originalTitle: String
    let releaseDate: String
    let overview: String
    var posterPathImage: UIImage?
    let posterURLString: String
    let id: Int
    
    
    var posterURL: URL? {
        return URL(string: posterURLString)
    }
    var image: UIImage?
    
    init?(dictionary: [String: Any]) {
        guard let originalTitle = dictionary[origianlTitleKey] as? String,
        let releaseDate = dictionary[releaseDateKey] as? String,
            let overview = dictionary[overviewKey] as? String,
        let posterURLString = dictionary[posterURLStringKey] as? String,
            let id = dictionary[idKey] as? Int else { return nil }
        
        self.originalTitle = originalTitle
        self.releaseDate = releaseDate
        self.overview = overview
        self.posterURLString = posterURLString
        self.id = id
        
    }
}
