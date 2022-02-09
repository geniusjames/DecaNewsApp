//
//  DashboardCollectionViewCell.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var authorsImage: UIImageView!
	@IBOutlet weak var authorsName: UILabel!
	@IBOutlet weak var estimatedReadTime: UILabel!
	@IBOutlet weak var topic: UILabel!
	
	let identifier = "DashboardCollectionView"
    
}
