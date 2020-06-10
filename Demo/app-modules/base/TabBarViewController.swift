//
//  TabBarViewController.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// Custom Tab-bar controller
class TabBarViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarView()
    }
}

extension TabBarViewController {
    // Tab-bar view
    func setupTabBarView() {
        // Assets tab
        let assetsTab =  UINavigationController(rootViewController: AssetsRouter.createModule())
        assetsTab.tabBarItem.image = UIImage(named: "assets")
        assetsTab.tabBarItem.title = "Assets"
        // Wallets tab
        let walletsTab =  UINavigationController(rootViewController: WalletsRouter.createModule())
        walletsTab.tabBarItem.image = UIImage(named: "wallets")
        walletsTab.tabBarItem.title = "Wallets"
        // tabs
        viewControllers = [assetsTab,walletsTab]
        tabBar.isTranslucent = true
        tabBar.tintColor =  AppTheme.primaryColor
    }
}
