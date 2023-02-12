//
//  Extensions.swift
//  App_Instagram
//
//  Created by Leticia Speda on 28/01/23.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom:NSLayoutYAxisAnchor? = nil,
                right:NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: top, constant: paddingTop)
            ])
        }
        
        if let left = left {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: left, constant: paddingLeft)
            ])
        }
        
        if let bottom = bottom {
            NSLayoutConstraint.activate([
                bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom)
            ])
        }
        
        if let right = right {
            NSLayoutConstraint.activate([
                rightAnchor.constraint(equalTo: right, constant: paddingRight)
            ])
        }
        
        if let width = width {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        if let height = height {
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: height)
            ])
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!)
        ])
    }
    
    func centerX(inView view: UIView, yConstant: CGFloat? = 0) {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func enableCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
