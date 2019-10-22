//
//  MainTabBarController.swift
//  PodCast
//
//  Created by Sky on 10/21/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let favoritesController = ViewController()
        favoritesController.tabBarItem.title = "Favorites"
        favoritesController.tabBarItem.image = #imageLiteral(resourceName: "favorites")
        
        let searchNavController = UINavigationController(rootViewController: ViewController())
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        viewControllers = [
            favoritesController,
            searchNavController
        ]
    }
}
