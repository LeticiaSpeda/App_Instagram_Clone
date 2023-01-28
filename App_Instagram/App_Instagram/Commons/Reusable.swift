//
//  Reusable.swift
//  App_Instagram
//
//  Created by Leticia Speda on 28/01/23.
//

import Foundation

protocol Reusable { }
extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}
