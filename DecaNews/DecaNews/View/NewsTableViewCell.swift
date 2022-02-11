//
//  BookmarksTableViewCell.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import UIKit
import CoreMedia

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsSectionLabel: UILabel!
    @IBOutlet weak var readingTimeLabel: UILabel!
    @IBOutlet weak var newsDaysLabel: UILabel!
    @IBOutlet weak var newsHeaderLabel: UILabel!
    private let viewModel = BookmarksViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func configureCell(index: Int) {
            newsSectionLabel.text = viewModel.items[index].articleDescription
            newsDaysLabel.text = viewModel.items[index].publishedAt
            newsHeaderLabel.text = viewModel.items[index].title
        }

}
