//
//  AddJobViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

protocol AddJobViewControllerDelegate: class {
    func willBeDismissed()
}

class AddJobViewController: UIViewController {
    
    
    
    var delegate: AddJobViewControllerDelegate?
    
    var viewTitle: UILabel!

    var titleTextLabel: UILabel!
    var titleTextField: UITextField!
    var nameTextLabel: UILabel!
    var nameTextField: UITextField!
    var emailTextLabel: UILabel!
    var emailTextField: UITextField!
    var priceTextLabel: UILabel!
    var priceTextField: UITextField!
    var bioTextLabel: UILabel!
    var bioTextView: UITextView!
    
    var pictureLabel: UILabel!
    var picture: UIImage!
    var pictureButton: UIButton!
    var imagePicker = UIImagePickerController()
    
    var titleErrorMessage: UILabel!
    var nameErrorMessage: UILabel!
    var emailErrorMessage: UILabel!
    var priceErrorMessage: UILabel!
    var bioErrorMessage: UILabel!
    
    var addJobButton: UIButton!
    var cancelButton: UIButton!
    
    let fieldWidth: CGFloat = UIScreen.main.bounds.width * 0.7
    
    //weak var delegate: addJobDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewTitle = UILabel()
        viewTitle.text = "Post a New Job!"
        viewTitle.textColor = UIColor(red: 77/255, green: 37/255, blue: 187/255, alpha: 1)
        viewTitle.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(viewTitle)
        
        titleTextLabel = UILabel()
        titleTextLabel.text = "Title:"
        view.addSubview(titleTextLabel)
        
        titleTextField = UITextField()
        titleTextField.placeholder = "Enter job title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.clearsOnBeginEditing = true
        view.addSubview(titleTextField)
        
        titleErrorMessage = UILabel()
        titleErrorMessage.font = UIFont.systemFont(ofSize: 16)
        titleErrorMessage.textColor = .red
        view.addSubview(titleErrorMessage)
     
        nameTextLabel = UILabel()
        nameTextLabel.text = "Name:"
        view.addSubview(nameTextLabel)
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.clearsOnBeginEditing = true
        view.addSubview(nameTextField)
        
        nameErrorMessage = UILabel()
        nameErrorMessage.font = UIFont.systemFont(ofSize: 16)
        nameErrorMessage.textColor = .red
        view.addSubview(nameErrorMessage)
        
        emailTextLabel = UILabel()
        emailTextLabel.text = "Email:"
        view.addSubview(emailTextLabel)
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.clearsOnBeginEditing = true
        view.addSubview(emailTextField)
        
        emailErrorMessage = UILabel()
        emailErrorMessage.font = UIFont.systemFont(ofSize: 16)
        emailErrorMessage.textColor = .red
        view.addSubview(emailErrorMessage)
        
        priceTextLabel = UILabel()
        priceTextLabel.text = "Price:"
        view.addSubview(priceTextLabel)
        
        priceTextField = UITextField()
        priceTextField.placeholder = "Ex. $20 an hour"
        priceTextField.borderStyle = .roundedRect
        priceTextField.clearsOnBeginEditing = true
        view.addSubview(priceTextField)
        
        priceErrorMessage = UILabel()
        priceErrorMessage.font = UIFont.systemFont(ofSize: 16)
        priceErrorMessage.textColor = .red
        view.addSubview(priceErrorMessage)
        
        bioTextLabel = UILabel()
        bioTextLabel.text = "Bio:"
        view.addSubview(bioTextLabel)
        
        bioTextView = UITextView()
        bioTextView.isEditable = true
        bioTextView.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        bioTextView.clearsOnInsertion = true
        bioTextView.layer.cornerRadius = 10
        bioTextView.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(bioTextView)
        
        bioErrorMessage = UILabel()
        bioErrorMessage.font = UIFont.systemFont(ofSize: 16)
        bioErrorMessage.textColor = .red
        view.addSubview(bioErrorMessage)
        
        pictureLabel = UILabel()
        pictureLabel.text = "Add a photo:"
        view.addSubview(pictureLabel)
        
        pictureButton = UIButton()
        pictureButton.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        pictureButton.setImage(UIImage(named:"empty-image.jpg"), for: .normal)
        pictureButton.layer.cornerRadius = 10
        pictureButton.clipsToBounds = true
        view.addSubview(pictureButton)
        
        imagePicker.delegate = self

        addJobButton = UIButton()
        addJobButton.setTitle("Post Job", for: .normal)
        addJobButton.setTitleColor(UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1), for: .normal)
        addJobButton.layer.borderWidth = 2
        addJobButton.layer.borderColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1).cgColor
        addJobButton.layer.cornerRadius = 10
        addJobButton.addTarget(self, action: #selector(addJob), for: .touchUpInside)
        view.addSubview(addJobButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1), for: .normal)
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1).cgColor
        cancelButton.layer.cornerRadius = 10
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        viewTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
        }
        
        titleErrorMessage.snp.makeConstraints { make in
            make.left.equalTo(titleTextField.snp.left)
            make.bottom.equalTo(titleTextField.snp.top).offset(-20)
        }
        
        titleTextLabel.snp.makeConstraints { make in
            make.left.equalTo(titleTextField.snp.left)
            make.bottom.equalTo(titleTextField.snp.top).offset(-3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.centerX.equalTo(view)
            make.width.equalTo(fieldWidth)
            make.height.equalTo(30)
        }
        
        nameErrorMessage.snp.makeConstraints { make in
            make.left.equalTo(nameTextField.snp.left)
            make.bottom.equalTo(nameTextField.snp.top).offset(-20)
        }
        
        
        nameTextLabel.snp.makeConstraints { make in
            make.left.equalTo(nameTextField.snp.left)
            make.bottom.equalTo(nameTextField.snp.top).offset(-3)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(45)
            make.centerX.equalTo(view)
            make.width.equalTo(fieldWidth)
            make.height.equalTo(30)
        }
        
        emailErrorMessage.snp.makeConstraints { make in
            make.left.equalTo(emailTextField.snp.left)
            make.bottom.equalTo(emailTextField.snp.top).offset(-20)
        }
        
        emailTextLabel.snp.makeConstraints { make in
            make.left.equalTo(emailTextField.snp.left)
            make.bottom.equalTo(emailTextField.snp.top).offset(-3)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(45)
            make.centerX.equalTo(view)
            make.width.equalTo(fieldWidth)
            make.height.equalTo(30)
        }
        
        priceErrorMessage.snp.makeConstraints { make in
            make.left.equalTo(priceTextField.snp.left)
            make.bottom.equalTo(priceTextField.snp.top).offset(-20)
        }
        
        priceTextLabel.snp.makeConstraints { make in
            make.left.equalTo(priceTextField.snp.left)
            make.bottom.equalTo(priceTextField.snp.top).offset(-3)
        }
        
        priceTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(45)
            make.centerX.equalTo(view)
            make.width.equalTo(fieldWidth)
            make.height.equalTo(30)
        }
        
        bioErrorMessage.snp.makeConstraints { make in
            make.left.equalTo(bioTextView.snp.left)
            make.bottom.equalTo(bioTextView.snp.top).offset(-20)
        }
        
        bioTextLabel.snp.makeConstraints { make in
            make.left.equalTo(bioTextView.snp.left)
            make.bottom.equalTo(bioTextView.snp.top).offset(-3)
        }
        
        bioTextView.snp.makeConstraints { make in
            make.top.equalTo(priceTextField.snp.bottom).offset(45)
            make.centerX.equalTo(view)
            make.width.equalTo(fieldWidth)
            make.height.equalTo(150)
        }
        
        pictureLabel.snp.makeConstraints { make in
            make.left.equalTo(pictureButton.snp.left)
            make.bottom.equalTo(pictureButton.snp.top).offset(-2)
        }
        
        pictureButton.snp.makeConstraints { make in
            make.top.equalTo(bioTextView.snp.bottom).offset(35)
            make.left.equalTo(bioTextView.snp.left)
            make.width.equalTo(UIScreen.main.bounds.width * 0.5)
            make.height.equalTo(150)
        }
        
        addJobButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-18)
            make.right.equalTo(view.snp.centerX).offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-18)
            make.left.equalTo(view.snp.centerX).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    @objc func showImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func addJob(){
        
        let title:String = titleTextField.text ?? ""
        let name:String = nameTextField.text ?? ""
        let email:String = emailTextField.text ?? ""
        let price:String = priceTextField.text ?? ""
        let bio:String = bioTextView.text ?? ""


        if title == "" {
            titleErrorMessage.text = "Please enter the job title."
        } else {
            titleErrorMessage.text = ""
        }
        
        if name == "" {
            nameErrorMessage.text = "Please enter your name."
        } else {
            nameErrorMessage.text = ""
        }
        
        if email == "" {
            emailErrorMessage.text = "Please enter your email."
        } else {
            emailErrorMessage.text = ""
        }
        
        if price == "" {
            priceErrorMessage.text = "Please enter a price."
        } else {
            priceErrorMessage.text = ""
        }
        
        if bio == "" {
            bioErrorMessage.text = "Please enter some information about the job."
        } else {
            bioErrorMessage.text = ""
        }
        
        
        //if let picture = pictureButton.currentImage{
            
            if title.isEmpty == false, name.isEmpty == false, email.isEmpty == false, price.isEmpty == false, bio.isEmpty == false{
                
                NetworkManager.createJob(title: title, name: name, email: email, price: price, bio: bio, completion: { job in
                    self.delegate?.willBeDismissed()
                    self.dismiss(animated: true)
                })
                //delegate?.postJob(newTitle: title, newName: name, newEmail: email, newPrice: price, newBio: bio /*, newPicture: picture */)
            }
        //}
    }
    
    @objc func cancel(){
         dismiss(animated: true, completion: nil)
     }
}

extension AddJobViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            pictureButton.setImage(image, for: .normal)
            picture = image
        }
        dismiss(animated: true, completion: nil)
    }
}





