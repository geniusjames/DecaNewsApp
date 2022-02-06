//
//  OnboardingViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 17/01/2022.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    let viewModel = OnboardingViewModel()
    @IBOutlet weak var onboardingCV: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet var indicators: [UILabel]!
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.addTarget(self, action: #selector(proceed), for: .touchUpInside)
        onboardingCV.delegate = self
        onboardingCV.dataSource = self
    }
    
    @objc func proceed() {
        coordinator?.navigateToSignIn()
    }
    @IBAction func skipButtonPressed(_ sender: Any) {
        proceed()
    }
}

extension OnboardingViewController: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.onboardingTitle.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellID,
                                                   for: indexPath) as? OnboardingCollectionViewCell
        else {
            return OnboardingCollectionViewCell()
        }
        cell.configureViewCell(indexPath: indexPath.row)
        print(indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        DispatchQueue.main.async { [self] in
            let row = indexPath.row
            titleLabel.text = viewModel.onboardingTitle[row]
            descriptionLabel.text = viewModel.onboardingDescription[row]
            proceedButton.setImage(UIImage(imageLiteralResourceName: viewModel.buttonImageNames[row]), for: .normal)
            indicators.enumerated().forEach { (index, indicator) in
                if index == row {
                    indicator.backgroundColor = .black
                } else {
                    indicator.backgroundColor = .gray
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width - 5
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
