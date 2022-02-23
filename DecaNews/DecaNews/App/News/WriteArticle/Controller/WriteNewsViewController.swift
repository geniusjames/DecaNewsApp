//
//  WriteNewsViewController.swift
//  DecaNews
//
//  Created by Decagon on 2/21/22.
//

import Foundation
import UIKit

class WriteNewsViewController: UIViewController {
    
    @IBOutlet weak var topicStack: UIStackView!
    @IBOutlet weak var contentStack: UIStackView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var titleStack: UIStackView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var uploadTitle: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var uploadLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentField: UITextView!
    @IBOutlet weak var topicField: UITextField!
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var publishButton: UIButton!
//    var coordinator: MainCoordinator?
    var imageData: Data?
    var image: UIImage?
    var writeNewsViewModel: WriteNewsViewModel?
    var navigateToPreview: (() -> Void)?
    var navigateToPickTopic: (() -> Void)?
    var news: NewsModel?
    var imageUrl: String = ""
    
    // MARK: - Coordinator Closures
    var didClickPreview: CoordinatorTransition?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write News"
        setupNavBarButtons()
        setUp()
    }
    
    override func viewDidLayoutSubviews() {
        setupLayoutConstraints()
        setValues()
    }
 
    func setupNavBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(preview))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(preview))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "deepPeach")
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "black")
    }
    
    @objc func preview() {
        
         news = NewsModel(title: titleField.text, content: contentField.text, topic: topicField.text, image: image)
        navigateToPreview?()
    }
    
    @objc func pickTopic() {
        navigateToPickTopic?()
    }
    
    @objc func imagePicker() {
      showImagePickerControllerActionSheet()
    }
    
    func coverImageStyle() {
        coverImage.clipsToBounds = true
        coverImage.layer.cornerRadius = 10
        coverImage.layer.borderWidth = 1
        coverImage.layer.masksToBounds = true
        coverImage.layer.borderColor = .init(gray: 255, alpha: 1)
        
    }
    
    func imageViewStyle() {
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        imageView.backgroundColor = UIColor.systemGray.withAlphaComponent(0)
    }
    
    func textFieldStyle() {
        topicField.rightView = view.arrow_downward
        contentField.layer.borderWidth = 1
        contentField.layer.cornerRadius = 10
        contentField.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        uniformFieldStyle(titleField, "Write title")
        uniformFieldStyle(topicField, "topic")
    }
    
    func setUp() {
        coverImageStyle()
        imageViewStyle()
        textFieldStyle()
        setButtonActions()
        topicField.addTarget(self, action: #selector(pickTopic), for: .allTouchEvents)
    }
    
    @objc func loadTopics() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .alert, title: "Choose topic", message: "Make", actions: [cancelAction], completion: nil)
    }
    
    func uniformFieldStyle(_ field: UITextField, _ placeHolder: String) {
        field.autocorrectionType = .no
        field.layer.borderWidth = 0.2
        field.layer.cornerRadius = 10
        field.placeholder = placeHolder
        field.rightViewMode = .always
    }
    
    func setButtonActions() {
        publishButton.addTarget(self, action: #selector(publishNews), for: .touchUpInside)
        uploadButton.addTarget(self, action: #selector(imagePicker), for: .touchUpInside)
    }

    func setValues() {
        if coverImage.image != nil {
           uploadLabel.text = "change image"
           uploadLabel.font  = UIFont.preferredFont(forTextStyle: .body)
           uploadLabel.textColor = .white
           uploadButton.imageView?.tintColor = .white
            imageView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
       }
    }
    
    @objc func publishNews(_ sender: UIButton) {
         writeNewsViewModel?
            .uploadImage(image: imageData!, completionHandler: uploadData(_:))
         if imageUrl != "" {
             writeNewsViewModel?
                 .saveToFirebase(title: titleField.text ?? "title", topic: "Science", content: contentField.text ?? "Content", cover: imageUrl, saveData(_:))
         }
    }

    func saveData(_ result: Result<String, Error>) {
        switch result {
        case .success(let id):
           print(id)
        case .failure(let error):

            print("\(error.localizedDescription)")

        }
    }
    
    func uploadData(_ result: Result<String, Error>) {
        switch result {
        case .success(let id):
            imageUrl = id
        case .failure(let error):

            print("\(error.localizedDescription)")

        }
    }
    
    func setupLayoutConstraints() {
        uploadTitle.anchored(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24))
    }
}
extension WriteNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library ", style: .default) { (_) in
                   self.showImagePickerController(sourceType: .photoLibrary)
               }
               let cameraAction = UIAlertAction(title: "Use camera", style: .default) { (_) in
                   self.showImagePickerController(sourceType: .camera)
               }
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               AlertService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            coverImage.image = editedImage
            image = editedImage
            imageData = editedImage.pngData()
        } else  if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            coverImage.image = originalImage
            image = originalImage
            imageData = originalImage.pngData()
        }
        
        dismiss(animated: true, completion: setValues)
    }
}

extension WriteNewsViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
