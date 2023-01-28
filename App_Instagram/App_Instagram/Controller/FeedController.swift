//
//  FeedController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 25/01/23.
//

import UIKit

//MARK: LifeCycle
final class FeedController: UICollectionViewController, Reusable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: Helpers
    private func commonInit() {
        configureUI()
        configureStyle()
    }
    
    private func configureUI() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: FeedController.identifier)
    }
    
    private func configureStyle() {
        collectionView.backgroundColor = .white
    }
}

//MARK: UiCollectionViewDataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedController.identifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
