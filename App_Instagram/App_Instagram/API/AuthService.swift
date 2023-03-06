//
//  AuthService.swift
//  App_Instagram
//
//  Created by Leticia Speda on 03/03/23.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials) {
     print("debug:\(credentials)")
    }
}
