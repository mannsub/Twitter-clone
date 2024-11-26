//
//  LoginController.swift
//  Twitter-clone
//
//  Created by MANSUB SHIN on 2024/11/26.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TwitterLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
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

    private let emailTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Email")

        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(placeholder: "Password")

        textField.isSecureTextEntry = true

        return textField
    }()

    private lazy var donthaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign Up")

        button.addAction(.init { [weak self] _ in
            // Switch screen 
            guard let currentViewController = self else { fatalError("Not found ViewController.") }
            let registrationController = RegistrationController()
            currentViewController.navigationController?.pushViewController(registrationController, animated: true)
        }, for: .touchUpInside)

        return button
    }()

    private let loginButton: UIButton = {
        let button = Utilities().logInSignUpButton(title: "Log In")

        button.addAction(.init { _ in
            print("Log In Now")
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

        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)

        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually

        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)

        view.addSubview(donthaveAccountButton)
        donthaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}
