//
//  SideMenuHeader.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

final class SideMenuHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    func setHeader(viewModel: SideMenuViewModel?) {
        let imageView = UIImageView()
        imageView.constrainHeight(constant: 140)
        let user = viewModel?.getUserDetails()
        if let imageURL = user?.photoURL {
            viewModel?.getImageData(url: imageURL) { data in
                imageView.image = UIImage(data: data)
            }
        } else {
            imageView.image = UIImage(systemName: "person")
        }
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.text = user?.displayName ?? "Name"
        addSubviews(imageView, nameLabel)
        imageView.centerInSuperview()
        nameLabel.anchored(top: imageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
        nameLabel.centerXInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
