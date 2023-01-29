//
//  FeedCell.swift
//  App_Instagram
//
//  Created by Leticia Speda on 28/01/23.
//

import UIKit

final class FeedCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImage(named: "venom-7")
        let view = UIImageView(image: image)
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 40 / 2
        view.enableCode()
        return view
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commoninit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(profileImageView)
    }
    
    private func configureConstraints() {
        profileImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            paddingTop: 12,
            paddingLeft: 12)
        profileImageView.anchor(width: 40, height: 40)
        
    }

    private func configureStyle() {
        backgroundColor = .white
        
    }
}
