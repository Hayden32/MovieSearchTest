//
//  ModelControllers.swift
//  MovieSearchTest
//
//  Created by Hayden Hastings on 2/24/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    static let apiKey = "128dc47582d97fb8af23c29a91c465de"
    
    static func fetchMovie(for movie: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let baseURL = baseURL else { completion([]); return }
        
        let urlParameters = ["query": movie, "api_key": apiKey]
        
        NetworkController.performRequest(for: baseURL, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let moviesArray = jsonDictionary["results"] as? [[String: Any]] else { completion([]); return }
            
            let movies = moviesArray.flatMap({ Movie(dictionary: $0)})
            
            for movie in movies {
                ImageController.image(forURL: movie.posterURLString, completion: { (image) in
                    movie.posterPathImage = image
                })
            }
            
            completion(movies)
        }
    }
}
