//
//  ImageController.swift
//  MovieSearchTest
//
//  Created by Hayden Hastings on 2/24/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation

import UIKit

class ImageController {
    
    static let baseURLString = "https://image.tmdb.org/t/p/w500/"
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: "\(baseURLString)/\(url)") else {
            fatalError("Image URL optional is nil")
        }
        
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else {
                    
                    DispatchQueue.main.async { completion(nil) }
                    return
            }
            DispatchQueue.main.async { completion(image) }
            
        }
    }
}
