//
//  NewsTopicsCollectionViewCell.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//

import UIKit

class NewsTopicsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var newsTopic: UILabel!
    @IBOutlet var circularBackgroundView: UIView!
}
