//
//  ProfileTableViewCell.swift
//  DecaNews
//
//  Created by Decagon on 09/02/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewProfile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
