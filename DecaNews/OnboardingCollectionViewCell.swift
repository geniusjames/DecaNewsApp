//
//  OnboardingCollectionViewCell.swift
//  DecaNews
//
//  Created by Geniusjames on 22/01/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var onboardingBackgroundPicture: UIImageView!

    func configureViewCell(indexPath: Int) {
        switch indexPath {
        case 0:
            onboardingBackgroundPicture.image = UIImage(imageLiteralResourceName: "onboarding0")
        case 1:
            onboardingBackgroundPicture.image = UIImage(imageLiteralResourceName: "onboarding1")
        case 2:
            onboardingBackgroundPicture.image = UIImage(imageLiteralResourceName: "onboarding2")
        default:
            break
        }
    }
}
