//
//  OnboardingCollectionViewCell.swift
//  DecaNews
//
//  Created by Geniusjames on 22/01/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var onboardingBackgroundPicture: UIImageView!
	let imageFileName = ["onboarding0", "onboarding1", "onboarding2"]
    func configureViewCell(indexPath: Int) {
        onboardingBackgroundPicture.image = UIImage(imageLiteralResourceName: imageFileName[indexPath])
    }
}
