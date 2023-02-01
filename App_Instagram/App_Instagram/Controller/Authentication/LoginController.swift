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
        tf.attributedPlaceholder = NSAttributedString(string: "email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
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
        tf.attributedPlaceholder = NSAttributedString(string: "password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField  ])
        stack.axis = .vertical
        stack.spacing = 5
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
    }
    
    private func configureConstraints() {
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
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
