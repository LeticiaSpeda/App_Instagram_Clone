//
//  LoginController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 31/01/23.
//

import UIKit

final class LoginController: UIViewController {
    
    //MARK: - Properties
    private lazy var iconImage: UIImageView = {
        let image = UIImage(named: "Instagram_logo_white")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.enableCode()
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(string: " Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.3)
        button.layer.cornerRadius = 8
        button.setHeight(50)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.6), .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "Forgot you password?", attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributedTitle.append(NSAttributedString(string: " Get help signing in", attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton()
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.6), .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "Don't haver an account? ", attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
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
    }
    
    private func configureHierarchy(){
        view.addSubview(iconImage)
        view.addSubview(mainVStack)
        view.addSubview(dontHaveAccountButton)
    }
    
    private func configureConstraints() {
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        mainVStack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: -32)
        
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
