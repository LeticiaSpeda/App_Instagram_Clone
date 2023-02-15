//
//  UIButton+Extensions.swift
//  App_Instagram
//
//  Created by Leticia Speda on 09/02/23.
//

import UIKit

extension UIButton {
    func attributedTitle(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(white: 1, alpha: 0.87),
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let attributedTitle = NSMutableAttributedString(
            string: "\(firstPart)",
            attributes: atts
        )
        let boldAtts: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(white: 1, alpha: 0.87),
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]
        attributedTitle.append(NSAttributedString(
            string: "\(secondPart)",
            attributes: boldAtts)
        )
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
}
