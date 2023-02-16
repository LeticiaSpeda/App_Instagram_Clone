//
//  CustonTextField.swift
//  App_Instagram
//
//  Created by Leticia Speda on 09/02/23.
//

import UIKit

final class CustonTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        layer.cornerRadius = 8
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor(white: 1, alpha: 0.7)
            ])
    }
    
    required init?(coder: NSCoder) { nil }
    
}
