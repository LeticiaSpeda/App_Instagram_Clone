//
//  UIViewController+Extensions.swift
//  App_Instagram
//
//  Created by Leticia Speda on 09/02/23.
//

import UIKit

extension UIViewController {
    func configureGradienteLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemYellow.cgColor
        ]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

