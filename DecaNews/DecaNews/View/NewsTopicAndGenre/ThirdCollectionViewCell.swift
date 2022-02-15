//
//  ThirdCollectionViewCell.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//
import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ThirdCollectionViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
  
   
    @IBOutlet var containerView: UIView!
    @IBOutlet var topBackgroundImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var seePostButton: UIButton!
    @IBAction func seePostActionButton(_ sender: Any) {
    }
    
}
