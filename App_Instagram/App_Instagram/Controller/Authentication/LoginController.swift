//
//  LoginController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 31/01/23.
//

import UIKit
import SwiftUI
import SwiftPreview

struct Login_PreviewProvider: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            LoginController()
        }
    }
}

final class LoginController: UIViewController {
    
    //MARK: - Properties
    private var viewModel = LoginViewModel()
    private lazy var iconImage: UIImageView = {
        let image = UIImage(named: "Instagram_logo_white")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.enableCode()
        return view
    }()
    
    private lazy var emailTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private lazy var passwordTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Password")
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
        button.backgroundColor = .blue.withAlphaComponent(0.4)
        button.setHeight(50)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(
            firstPart: "Forgot you password?",
            secondPart: " Get help signing in"
        )
        return button
    }()
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(
            firstPart: "Don't haver an account? ",
            secondPart: "Sign Up"
        )
        button.addTarget(
            self,
            action: #selector(handleShowSingUp),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                emailTextField,
                passwordTextField,
                loginButton,
                forgotPasswordButton
            ])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    //MARK: - Helpers
    private func commonInit() {
        configureStyle()
        configureHierarchy()
        configureConstraints()
        configureNotificationObservers()
    }
    
    //MARK: - Actions
    @objc func handleShowSingUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender === emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        loginButton.backgroundColor = viewModel.buttomBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
        
    }
    
    private func configureHierarchy(){
        view.addSubview(iconImage)
        view.addSubview(mainVStack)
        view.addSubview(dontHaveAccountButton)
    }
    
    private func configureConstraints() {
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 32
        )
        mainVStack.anchor(
            top: iconImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: -32
        )
        
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(
            bottom: view.safeAreaLayoutGuide.bottomAnchor
        )
    }
    
    private func configureStyle() {
        configureGradienteLayer()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func configureNotificationObservers(){
        emailTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}
