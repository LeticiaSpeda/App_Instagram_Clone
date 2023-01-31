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
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("venom", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(
            self, action: #selector(didTapUserName),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImage(named: "venom-7")
        let view = UIImageView(image: image)
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.enableCode()
        return view
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some test caption for now..."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 day ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func didTapUserName() {
        print("DEBUG: DID TAP")
    }
    
    private func commoninit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(usernameButton)
        addSubview(postImageView)
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
        addSubview(mainHStack)
    }
    
    private func configureConstraints() {
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
        profileImageView.anchor(width: 40, height: 40)
        
        usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
        
        postImageView.anchor(
            top: profileImageView.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 8
        )
        postImageView.heightAnchor.constraint(
            equalTo: widthAnchor,
            multiplier: 1
        ).isActive = true
        
        mainHStack.anchor(
            top: postImageView.bottomAnchor,
            width: 120,
            height: 50
        )
        
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        captionLabel.anchor(top: likesLabel.bottomAnchor, left:  leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
}
