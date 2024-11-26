//
//  RegistrationController.swift
//  Twitter-clone
//
//  Created by MANSUB SHIN on 2024/11/26.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties

    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        guard let plusPhotoImage = UIImage(named: "plus_photo") else { fatalError("Not found image.") }

        button.setImage(plusPhotoImage, for: .normal)
        button.tintColor = .white

        button.addAction(.init { [weak self] _ in
            // Select images
            guard let self = self else { fatalError("Not found ViewController.") }
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)

        }, for: .touchUpInside)

        return button

    }()

    private lazy var emailContainerView: UIView = {
        guard let imageView = UIImage(named: "ic_mail_outline_white_2x-1") else { fatalError("Not found image.") }
        let view = Utilities().inputContainerView(image: imageView, textField: emailTextField)

        return view
    }()

    private lazy var passwordContainerView: UIView = {
        guard let imageView = UIImage(named: "ic_lock_outline_white_2x") else { fatalError("Not found image.") }
        let view = Utilities().inputContainerView(image: imageView, textField: passwordTextField)

        return view
    }()

    private lazy var fullnameContainerView: UIView = {
        guard let imageView = UIImage(named: "ic_person_outline_white_2x") else { fatalError("Not found image.") }
        let view = Utilities().inputContainerView(image: imageView, textField: fullnameTextField)

        return view
    }()

    private lazy var usernameContainerView: UIView = {
        guard let imageView = UIImage(named: "ic_person_outline_white_2x") else { fatalError("Not found image.") }
        let view = Utilities().inputContainerView(image: imageView, textField: usernameTextField)

        return view
    }()

    private let emailTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Email")

        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Password")

        textField.isSecureTextEntry = true

        return textField
    }()

    private let fullnameTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Full Name")

        return textField
    }()

    private let usernameTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Username")

        return textField
    }()

    private lazy var alreadyhaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Log In")

        button.addAction(.init { [weak self] _ in
            // Switch Screen
            guard let currentViewController = self else { fatalError("Not found ViewController.") }
            currentViewController.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        return button
    }()

    private let signUpButton: UIButton = {
        let button = Utilities().logInSignUpButton(title: "Sign Up")

        button.addAction(.init { _ in
            print("Sign Up Now")
        }, for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true

        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 128, height: 128)

        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullnameContainerView, usernameContainerView, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually

        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

        view.addSubview(alreadyhaveAccountButton)
        alreadyhaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            plusPhotoButton.layer.cornerRadius = 128 / 2
            plusPhotoButton.layer.masksToBounds = true
            plusPhotoButton.imageView?.contentMode = .scaleAspectFill
            plusPhotoButton.imageView?.clipsToBounds = true
            plusPhotoButton.layer.borderColor = UIColor.white.cgColor
            plusPhotoButton.layer.borderWidth = 3
            plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
