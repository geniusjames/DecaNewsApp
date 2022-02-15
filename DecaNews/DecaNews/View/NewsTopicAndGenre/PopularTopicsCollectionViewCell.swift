//
//  PopularTopicsCollectionViewCell.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//
import UIKit

class PopularTopicsCollectionViewCell: UICollectionViewCell {
   @IBOutlet var circularView: UIView!
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var seeMoreButton: UIButton?
    @IBOutlet var newsSource: UILabel!
    @IBOutlet var sourceLogo: UILabel!
    
//    rgb(216,96,93)
    
    static let identifier = "PopularTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circularView.layer.borderWidth = 1
        self.circularView.layer.borderColor = UIColor(red:216/255, green:96/255, blue:93/255, alpha: 1).cgColor
    }
}
