//
//  MovieCollectionViewCell.swift
//  CollectionView
//
//  Created by Wojciech Spaleniak on 28/10/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        titleLbl.text = movie.title
    }
}
