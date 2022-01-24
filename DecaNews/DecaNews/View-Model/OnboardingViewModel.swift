//
//  OnboardingViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 19/01/2022.
//

import Foundation
import UIKit

class OnboardingViewModel {

    let onboardingTitle = ["Discover Curated News",
                           "Update News Everyday",
                           "Browse by Categories"]
    let onboardingDescription = ["Keep up-to-date with the actual and valid news everyday",
                                 "Get the recent news everyday with DecaNews",
                                 "Get the recent news everyday with DecaNews"]
    let cellID = "onboarding"

    func configureView(titleLabel: UILabel, descriptionLabel: UILabel, indexPath: Int) {
        switch indexPath {
        case 0:
            titleLabel.text = onboardingTitle[0]
            descriptionLabel.text = onboardingDescription[0]
        case 1:
            titleLabel.text = onboardingTitle[1]
            descriptionLabel.text = onboardingDescription[1]
        case 2:
            titleLabel.text = onboardingTitle[2]
            descriptionLabel.text = onboardingDescription[2]
        default:
            break
        }
    }
    func configureIndicators(pageIndicator: [UILabel], proceedButton: UIButton, indexPath: Int) {
    
        switch indexPath {
        case 0:
            pageIndicator[0].backgroundColor = .black
            pageIndicator[1].backgroundColor = .gray
            pageIndicator[2].backgroundColor = .gray
            proceedButton.setImage(UIImage(imageLiteralResourceName: "button0"), for: .normal)
        case 1:
            pageIndicator[0].backgroundColor = .gray
            pageIndicator[1].backgroundColor = .black
            pageIndicator[2].backgroundColor = .gray
            proceedButton.setImage(UIImage(imageLiteralResourceName: "button1"), for: .normal)
        case 2:
            pageIndicator[0].backgroundColor = .gray
            pageIndicator[1].backgroundColor = .gray
            pageIndicator[2].backgroundColor = .black
            proceedButton.setImage(UIImage(imageLiteralResourceName: "button2"), for: .normal)
        default:
            break
        }
    }
}
