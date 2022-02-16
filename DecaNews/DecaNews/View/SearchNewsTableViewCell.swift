//
//  SearchNewsTableViewCell.swift
//  DecaNews
//
//  Created by Decagon on 15/02/2022.
//

import UIKit

class SearchNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var readTimeLabel: UILabel!
    @IBOutlet weak var daysAgoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var profilePictureImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func bookMarkAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cellData: Article, category: String) {
        titleLabel.text = cellData.title
        categoryLabel.text = category
        readTimeLabel.text = "\(2) mins read"
        daysAgoLabel.text = "\(1) day ago"
        if let cellImage = cellData.urlToImage, let url = URL(string: cellImage) {
            NetworkManagers().getImageDataFroms(url: url, imageCell: profilePictureImgView)
        }
    }

}
