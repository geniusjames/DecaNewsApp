//
//  WriteNewsViewController.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.
//

import Foundation
import UIKit

class WriteNewsViewController: UIViewController {
    private let viewLayout = WriteNewsControllerLayout()
   
    var imageData: Data?
    var image: UIImage?
    var writeNewsViewModel: WriteNewsViewModel?
    var news: NewsModel?
    var imageUrl: String = ""
    
    // MARK: - Coordinator Closures
    var navigateToPreview: CoordinatorTransition?
    var navigateToPickTopic: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write News"
        setupNavBarButtons()
        setActionsEvents()
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
        news = NewsModel(title: viewLayout.titleField.text ?? "Hell", content: viewLayout.contentField.text ?? "Content", topic: viewLayout.topicField.text, image: image)
        navigateToPreview?()
    }
    
    @objc func pickTopic() {
        navigateToPickTopic?()
    }
    
    @objc func pickImage() {
      showImagePickerControllerActionSheet()
    }
    
    @objc func loadTopics() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .alert, title: "Choose topic", message: "Make", actions: [cancelAction], completion: nil)
    }
    
    func setActionsEvents() {
        viewLayout.publishButton.addTarget(self, action: #selector(publishNews), for: .touchUpInside)
        viewLayout.uploadButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        viewLayout.topicField.addTarget(self, action: #selector(pickTopic), for: .allTouchEvents)
    }

    func setValues() {
        if viewLayout.coverImage.image != nil {
            viewLayout.uploadLabel.text = "change image"
            viewLayout.uploadLabel.font  = UIFont.preferredFont(forTextStyle: .body)
            viewLayout.uploadLabel.textColor = .white
            viewLayout.uploadButton.imageView?.tintColor = .white
            viewLayout.imageView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
       }
    }
    
    @objc func publishNews(_ sender: UIButton) {
         writeNewsViewModel?
            .uploadImage(image: imageData!, completionHandler: uploadData(_:))
         if imageUrl != "" {
             writeNewsViewModel?
                 .saveToFirebase(title: viewLayout.titleField.text ?? "title", topic: "Science", content: viewLayout.contentField.text ?? "Content", cover: imageUrl, saveData(_:))
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
    
    fileprivate func setupLayoutConstraints() {
        view.addSubview(viewLayout)
        viewLayout.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([viewLayout.topAnchor.constraint(equalTo: view.topAnchor),
        viewLayout.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        viewLayout.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        viewLayout.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
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
            viewLayout.coverImage.image = editedImage
            image = editedImage
            imageData = editedImage.pngData()
        } else  if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            viewLayout.coverImage.image = originalImage
            image = originalImage
            imageData = originalImage.pngData()
        }
        
        dismiss(animated: true, completion: setValues)
    }
}

extension WriteNewsViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
