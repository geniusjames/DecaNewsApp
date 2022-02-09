//
//  DashboardTableViewCell.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
	
	@IBOutlet weak var authorsImage: UIImageView!
	@IBOutlet weak var topicLabel: UILabel!
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var AuthorsName: UILabel!
	@IBOutlet weak var estimatedReadTime: UILabel!
	@IBOutlet weak var bookmarkBtn: UIButton!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
