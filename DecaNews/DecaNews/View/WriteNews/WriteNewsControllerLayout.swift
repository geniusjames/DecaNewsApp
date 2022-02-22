//
//  WriteNewsControllerLayout.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/22/22.
//


import Foundation
import UIKit

class WriteNewsControllerLayout: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    override func layoutSubviews() {
        setUpScrollView()
        setUpView()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var topicStack: UIStackView = {
        
    }()
    lazy var contentStack: UIStackView = {
        
    }()
    lazy var imageView: UIView = {
        
    }()
    lazy  var titleStack: UIStackView = {
        
    }()
    lazy var coverImage: UIImageView = {
        var image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2).isActive = true
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    lazy var uploadTitle: UILabel = {
        var label = UILabel()

        return label
        
    }()
    lazy var uploadButton: UIButton = {
        
    }()
    lazy  var uploadLabel: UILabel = {
        
    }()
  lazy var titleLabel: UILabel = {
      var label = UILabel()
      label.numberOfLines = 0
      label.textAlignment = .center
      label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    lazy var titleField: UITextField = {
        
    }()
    lazy var contentLabel: UILabel = {
        var label = UILabel()

        return label
        
    }()
    lazy var contentField: UITextView = {
        let textView = UITextView()
       textView.smartDashesType = .default
       textView.dataDetectorTypes = .all
       textView.smartQuotesType = .yes
       textView.isUserInteractionEnabled = false
        textView.textAlignment = .natural
//        textView.numberOfLines = 0
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
       textView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.7).isActive = true
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.backgroundColor = UIColor.lightGray
        return textView

        
    }()
    lazy var topicField: UITextField = {
        
    }()
    lazy var topicLabel: UILabel = {
        var label = UILabel()

        return label
        
    }()
    
    lazy var publishButton: UIButton = {
        
    }()
    
    func coverImageStyle() {
     .coverImage.clipsToBounds = true
        viewLayout.coverImage.layer.cornerRadius = 10
        viewLayout.coverImage.layer.borderWidth = 1
        viewLayout.coverImage.layer.masksToBounds = true
        viewLayout.coverImage.layer.borderColor = .init(gray: 255, alpha: 1)
        
    }
    func uniformFieldStyle(_ field: UITextField, _ placeHolder: String) {
        field.autocorrectionType = .no
        field.layer.borderWidth = 0.2
        field.layer.cornerRadius = 10
        field.placeholder = placeHolder
        field.rightViewMode = .always
    }
    
    func imageViewStyle() {
        viewLayout.imageView.layer.borderWidth = 1
        viewLayout.imageView.layer.cornerRadius = 10
        viewLayout.imageView.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        viewLayout.imageView.backgroundColor = UIColor.systemGray.withAlphaComponent(0)
    }
    
    func textFieldStyle() {
        viewLayout.topicField.rightView = view.arrow_downward
        viewLayout.contentField.layer.borderWidth = 1
        viewLayout.contentField.layer.cornerRadius = 10
        viewLayout.contentField.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        uniformFieldStyle(titleField, "Write title")
        uniformFieldStyle(topicField, "topic")
    }
    

    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    func setUpScrollView() {
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor)
        contentViewHeight.priority = .defaultLow
        let layout = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: layout.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
        
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    func setUpView() {
        
        contentView.addSubviews(newsTitle, newsCover, newsDetails)
                
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            newsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            newsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            newsCover.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 20),
            
            newsCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            newsCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            newsDetails.topAnchor.constraint(equalTo: newsCover.bottomAnchor, constant: 20),
            
            newsDetails.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            newsDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
