//
//  MovieTableViewCell.swift
//  MovieDetailsMVVM
//
//  Created by Luis Fontinelles on 04/03/25.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    static var identifier: String {
        get {
            "MovieTableViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.round()
        containerView.addBorder(color: .lightGray, width: 1)
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.dateLable.text = viewModel.date
        self.scoreLabel.text = viewModel.score
        self.movieImageView.sd_setImage(with: viewModel.image)
    }
}
