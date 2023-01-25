//
//  MainTabBarController.swift
//  App_Instagram
//
//  Created by Leticia Speda on 25/01/23.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - Helpers
    private func commonInit() {
        configureViewController()
        configureStyle()
    }
    private func configureViewController() {
        let feed = templateNavigationController(unselectedImage: UIImage(named: "home_selected") ?? UIImage(), selectedImage: UIImage(named: "home_selected") ?? UIImage(), rootViewController: FeedController())
        
        let search = templateNavigationController(unselectedImage: UIImage(named: "search_selected") ?? UIImage(), selectedImage: UIImage(named: "search_selected") ?? UIImage(), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: UIImage(named: "plus_unselected") ?? UIImage(), selectedImage: UIImage(named: "plus_unselected") ?? UIImage(), rootViewController: ImageSelectorController())
        
        let notifications = templateNavigationController(unselectedImage: UIImage(named: "like_unselected") ?? UIImage(), selectedImage: UIImage(named: "like_unselected") ?? UIImage(), rootViewController: NotificationController())
        
        let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_selected") ?? UIImage(), selectedImage: UIImage(named: "profile_selected") ?? UIImage(), rootViewController: ProfileController())
        
        viewControllers = [feed,search,imageSelector,notifications,profile]
    }
    
    private func configureStyle() {
        tabBar.backgroundColor = .white.withAlphaComponent(0.8)
    }
    
    private func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController)-> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
