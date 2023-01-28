//
//  FeedController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 25/01/23.
//

import UIKit

//MARK: LifeCycle
final class FeedController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: Helpers
    private func commonInit() {
        configureStyle()
    }
    
    private func configureStyle() {
        collectionView.backgroundColor = .white
    }
}
