//
//  MovieTableViewCell.swift
//  MovieSearchTest
//
//  Created by Hayden Hastings on 2/24/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var postweImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    func updateViews() {
        guard let movie = movie else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = movie.originalTitle
            self.resultsLabel.text = movie.releaseDate
            self.overviewTextView.text = movie.overview
            ImageController.image(forURL: movie.posterURLString, completion: { (image) in
                self.postweImageView.image = image
            })
        }
            
        
        
        
    }
    
    var movie: Movie? {
        didSet {
            DispatchQueue.main.async {
                
                self.updateViews()
            }
        }
    }
    
}
