//
//  EditProfilePageViewController.swift
//  DecaNews
//
//  Created by Decagon on 14/02/2022.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class EditProfilePageViewController: UIViewController {
    var fireStore: FireStorePersistence?
    var fireService: FirebaseService?
    let user = fireService?.getUserDetails()
    var coordinator: MainCoordinator?
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userBio: UITextView!
    @IBOutlet weak var userPhoneNumber: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        UserDetails()
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
        actionSheet()
    }
    
    @IBAction func updateUserInfo(_ sender: Any) {
        updateUserDetails()
    }
    func actionSheet() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [UTType.image.identifier]
            self.present(image, animated: true, completion: nil)
            
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .photoLibrary
            image.delegate = self
            image.mediaTypes = [UTType.image.identifier]
            self.present(image, animated: true, completion: nil)
        }
    }
    
    func UserDetails(){
        let user = fireService?.getUserDetails()
        userName.text = user?.displayName
        userEmail.text = user?.email
    }
    
    func updateUserDetails(){
        let user = fireService?.getUserDetails()
        user?.updateEmail(to: userEmail.text, completion: nil)
        fireService.collection("userDetails").updateData(["Bio": userBio.text, "name":userName.text, "phoneNumber":userPhoneNumber.text])
    }
}

extension EditProfilePageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        print(info)
        if let editingImage = info[UIImagePickerController.InfoKey(rawValue: convertInfoKey(UIImagePickerController.InfoKey.editedImage))] as? UIImage {
            profileImage.image = editingImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertImageToDict (_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map({ key, value in (key.rawValue, value)
            
        }))
    }
    
    func convertInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
    
}
