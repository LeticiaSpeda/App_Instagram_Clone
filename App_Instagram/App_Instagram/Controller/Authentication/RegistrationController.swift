//
//  RegistrationController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 31/01/23.
//

import UIKit
import SwiftUI
import SwiftPreview

struct Register_PreviewProvider: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            RegistrationController()
        }
    }
}

final class RegistrationController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ emailTextField, passwordTextField, fullNameTextField, userNameTextField, singUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var plusPhotoButton: UIButton = {
        let image = UIImage(named: "plus_photo")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white
        return button
    }()
    
    private lazy var emailTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private lazy var passwordTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Password")
        tf.keyboardType = .emailAddress
        return tf
    }()

    private lazy var fullNameTextField = CustonTextField(placeholder: "FullName")
    
    private lazy var userNameTextField = CustonTextField(placeholder: "UserName")
    
    private lazy var singUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .blue.withAlphaComponent(0.4)
        button.setHeight(50)
        return button
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
    
    private func configureHierarchy() {
        view.addSubview(plusPhotoButton)
        view.addSubview(mainVStack)
    }
    
    private func configureConstraints() {
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        mainVStack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: -32)
        
    }
    
    private func configureStyle() {
        configureGradienteLayer()
    }
}
