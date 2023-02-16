//
//  AuthenticationViewModel.swift
//  App_Instagram
//
//  Created by Leticia Speda on 12/02/23.
//

import UIKit

struct LoginViewModel {
    var email: String?
    var password: String?
    
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    
    var buttomBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
}
 
struct RegistrationViewModel {
    
}
