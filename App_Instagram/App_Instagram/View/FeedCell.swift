//
//  FeedCell.swift
//  App_Instagram
//
//  Created by Leticia Speda on 28/01/23.
//

import UIKit

final class FeedCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
