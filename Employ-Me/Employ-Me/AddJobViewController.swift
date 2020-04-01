//
//  AddJobViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class AddJobViewController: UIViewController {
    
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
    
    weak var delegate: addJobDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewTitle = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.text = "Post a New Job!"
        viewTitle.textColor = UIColor(red: 249/255, green: 184/255, blue: 19/255, alpha: 1)
        viewTitle.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(viewTitle)
        
        titleTextLabel = UILabel()
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextLabel.text = "Title:"
        view.addSubview(titleTextLabel)
        
        titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Enter job title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.clearsOnBeginEditing = true
        view.addSubview(titleTextField)
        
        titleErrorMessage = UILabel()
        titleErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        titleErrorMessage.text = ""
        titleErrorMessage.font = UIFont.systemFont(ofSize: 16)
        titleErrorMessage.textColor = .red
        view.addSubview(titleErrorMessage)
     
        nameTextLabel = UILabel()
        nameTextLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextLabel.text = "Name:"
        view.addSubview(nameTextLabel)
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.clearsOnBeginEditing = true
        view.addSubview(nameTextField)
        
        nameErrorMessage = UILabel()
        nameErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        nameErrorMessage.text = ""
        nameErrorMessage.font = UIFont.systemFont(ofSize: 16)
        nameErrorMessage.textColor = .red
        view.addSubview(nameErrorMessage)
        
        emailTextLabel = UILabel()
        emailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextLabel.text = "Email:"
        view.addSubview(emailTextLabel)
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.clearsOnBeginEditing = true
        view.addSubview(emailTextField)
        
        emailErrorMessage = UILabel()
        emailErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        emailErrorMessage.text = ""
        emailErrorMessage.font = UIFont.systemFont(ofSize: 16)
        emailErrorMessage.textColor = .red
        view.addSubview(emailErrorMessage)
        
        priceTextLabel = UILabel()
        priceTextLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTextLabel.text = "Price:"
        view.addSubview(priceTextLabel)
        
        priceTextField = UITextField()
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.placeholder = "Ex. $20 an hour"
        priceTextField.borderStyle = .roundedRect
        priceTextField.clearsOnBeginEditing = true
        view.addSubview(priceTextField)
        
        priceErrorMessage = UILabel()
        priceErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        priceErrorMessage.text = ""
        priceErrorMessage.font = UIFont.systemFont(ofSize: 16)
        priceErrorMessage.textColor = .red
        view.addSubview(priceErrorMessage)
        
        bioTextLabel = UILabel()
        bioTextLabel.translatesAutoresizingMaskIntoConstraints = false
        bioTextLabel.text = "Bio:"
        view.addSubview(bioTextLabel)
        
        bioTextView = UITextView()
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.isEditable = true
        bioTextView.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        bioTextView.clearsOnInsertion = true
        bioTextView.layer.cornerRadius = 10
        bioTextView.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(bioTextView)
        
        bioErrorMessage = UILabel()
        bioErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        bioErrorMessage.text = ""
        bioErrorMessage.font = UIFont.systemFont(ofSize: 16)
        bioErrorMessage.textColor = .red
        view.addSubview(bioErrorMessage)
        
        pictureLabel = UILabel()
        pictureLabel.translatesAutoresizingMaskIntoConstraints = false
        pictureLabel.text = "Add a photo:"
        view.addSubview(pictureLabel)
        
        pictureButton = UIButton()
        pictureButton.translatesAutoresizingMaskIntoConstraints = false
        pictureButton.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        pictureButton.setImage(UIImage(named:"empty-image.jpg"), for: .normal)
        pictureButton.layer.cornerRadius = 10
        pictureButton.clipsToBounds = true
        view.addSubview(pictureButton)
        
        imagePicker.delegate = self

        addJobButton = UIButton()
        addJobButton.translatesAutoresizingMaskIntoConstraints = false
        addJobButton.setTitle("Post Job", for: .normal)
        addJobButton.setTitleColor(UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1), for: .normal)
        addJobButton.layer.borderWidth = 2
        addJobButton.layer.borderColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1).cgColor
        addJobButton.layer.cornerRadius = 10
        addJobButton.addTarget(self, action: #selector(addJob), for: .touchUpInside)
        view.addSubview(addJobButton)
        
        cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
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
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleErrorMessage.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            titleErrorMessage.bottomAnchor.constraint(equalTo: titleTextField.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            titleTextLabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            titleTextLabel.bottomAnchor.constraint(equalTo: titleTextField.topAnchor, constant: -3)
        ])
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.7),
            titleTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameErrorMessage.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            nameErrorMessage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            nameTextLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            nameTextLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -3)
        ])
         
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 45),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.7),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            emailErrorMessage.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            emailErrorMessage.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            
        ])
        
        NSLayoutConstraint.activate([
            emailTextLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            emailTextLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -2)
        ])
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 45),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.7),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            priceErrorMessage.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor),
            priceErrorMessage.bottomAnchor.constraint(equalTo: priceTextField.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            priceTextLabel.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor),
            priceTextLabel.bottomAnchor.constraint(equalTo: priceTextField.topAnchor, constant: -2)
        ])
          
        NSLayoutConstraint.activate([
            priceTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 45),
            priceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceTextField.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.7),
            priceTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bioErrorMessage.leadingAnchor.constraint(equalTo: bioTextView.leadingAnchor),
            bioErrorMessage.bottomAnchor.constraint(equalTo: bioTextView.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            bioTextLabel.leadingAnchor.constraint(equalTo: bioTextView.leadingAnchor),
            bioTextLabel.bottomAnchor.constraint(equalTo: bioTextView.topAnchor, constant: -2)
        ])
          
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 45),
            bioTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bioTextView.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.7),
            bioTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            pictureLabel.leadingAnchor.constraint(equalTo: pictureButton.leadingAnchor),
            pictureLabel.bottomAnchor.constraint(equalTo: pictureButton.topAnchor, constant: -2)
        
        ])
        
        NSLayoutConstraint.activate([
            pictureButton.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 35),
            pictureButton.leadingAnchor.constraint(equalTo: bioTextView.leadingAnchor),
            pictureButton.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width * 0.5),
            pictureButton.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            addJobButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            addJobButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            addJobButton.heightAnchor.constraint(equalToConstant: 40),
            addJobButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            cancelButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            cancelButton.widthAnchor.constraint(equalToConstant: 100)

        ])
            
    }
    
    @objc func showImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func addJob(){
        
        let optionalTitle: String? = titleTextField.text
        let optionalName: String? = nameTextField.text
        let optionalEmail: String? = emailTextField.text
        let optionalPrice: String? = priceTextField.text
        let optionalBio: String? = bioTextView.text

        if let unwrappedTitle = optionalTitle, unwrappedTitle == "" {
               titleErrorMessage.text = "Please enter the job title."
        } else {
            titleErrorMessage.text = ""
        }
        

        if let unwrappedName = optionalName, unwrappedName == "" {
               nameErrorMessage.text = "Please enter your name."
        } else {
            nameErrorMessage.text = ""
        }
        
        
        if let unwrappedEmail = optionalEmail, unwrappedEmail == "" {
               emailErrorMessage.text = "Please enter your email."
        } else {
            emailErrorMessage.text = ""
        }
        
        
        if let unwrappedPrice = optionalPrice, unwrappedPrice == "" {
               priceErrorMessage.text = "Please enter a price."
        } else {
            priceErrorMessage.text = ""
        }
        
        
        if let unwrappedBio = optionalBio, unwrappedBio == "" {
               bioErrorMessage.text = "Please enter some information about the job."
        } else{
            bioErrorMessage.text = ""
        }
        
        
        if let title = optionalTitle, let name = optionalName, let email = optionalEmail, let price = optionalPrice, let bio = optionalBio, let picture = pictureButton.currentImage{
            
            if title.isEmpty == false, name.isEmpty == false, email.isEmpty == false, price.isEmpty == false, bio.isEmpty == false{
                delegate?.postJob(newTitle: title, newName: name, newEmail: email, newPrice: price, newBio: bio, newPicture: picture)
                dismiss(animated: true, completion: nil)
            }
        }
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





