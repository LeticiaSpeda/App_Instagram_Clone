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
    private var viewModel = RegistrationViewModel()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            fullNameTextField,
            userNameTextField,
            signUpButton
        ])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var plusPhotoButton: UIButton = {
        let image = UIImage(named: "plus_photo")?.withTintColor(
            .white, renderingMode: .alwaysOriginal
        )
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(
            self,
            action: #selector(handleProfilePhotoSelect),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var emailTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Email")
        tf.isSecureTextEntry = false
        return tf
    }()
    
    private lazy var passwordTextField: CustonTextField = {
        let tf = CustonTextField(placeholder: " Password")
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var fullNameTextField = CustonTextField(
        placeholder: "FullName"
    )
    
    private lazy var userNameTextField = CustonTextField(
        placeholder: "UserName"
    )
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.6)
        button.setHeight(50)
        return button
    }()
    
    private lazy var AlreadyHaveAccountButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(
            firstPart: "Already haver an account? ",
            secondPart: "Sign Up"
        )
        button.addTarget(
            self,
            action: #selector(handleShowLogin),
            for: .touchUpInside
        )
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - Actions
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender === emailTextField {
            viewModel.email = sender.text
        } else if sender === passwordTextField {
            viewModel.password = sender.text
        } else if sender === fullNameTextField {
            viewModel.fullname = sender.text
        } else {
            viewModel.username = sender.text
        }
        
        updateForm()
    }
    
    @objc func handleProfilePhotoSelect() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    //MARK: - Helpers
    private func commonInit() {
        configureStyle()
        configureHierarchy()
        configureConstraints()
        configureNotificationObservers()
    }
    
    private func configureHierarchy() {
        view.addSubview(plusPhotoButton)
        view.addSubview(mainVStack)
        view.addSubview(AlreadyHaveAccountButton)
    }
    
    private func configureConstraints() {
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 32
        )
        
        mainVStack.anchor(
            top: plusPhotoButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: -32
        )
        
        AlreadyHaveAccountButton.centerX(inView: view)
        AlreadyHaveAccountButton.anchor(
            bottom: view.safeAreaLayoutGuide.bottomAnchor
        )
    }
    
    private func configureStyle() {
        configureGradienteLayer()
    }
    
    private func configureNotificationObservers(){
        emailTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged)
        passwordTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged
        )
        fullNameTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged)
        userNameTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged
        )
    }
}

//MARK: - FormViewModel
extension RegistrationController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgrounColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

//MARK: - UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectImage = info[.editedImage] as? UIImage else { return }
        
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.setImage(
            selectImage.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        
        dismiss(animated: true)
    }
}
