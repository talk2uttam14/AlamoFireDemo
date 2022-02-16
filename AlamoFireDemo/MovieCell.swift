//
//  MovieCell.swift
//  AlamoFireDemo
//
//  Created by comviva on 10/02/22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var ratingL: UILabel!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var rDateL: UILabel!
    @IBOutlet weak var overviewL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
