//
//  CommentsCell.swift
//  DecaNews
//
//  Created by Decagon on 09/02/2022.
//

import UIKit

class CommentsCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var likeBtn: UIStackView!
    
    @IBOutlet weak var likeCount: UILabel!
    
    @IBAction func likeButton(_ sender: UIButton) {
        likeBtn.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
