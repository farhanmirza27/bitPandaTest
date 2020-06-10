//
//  AppDelegate.swift
//  Demo
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setupNavbar()
        window?.rootViewController = TabBarViewController()
        return true
    }
    
}

extension AppDelegate {
    private func setupNavbar() {
           // Nav-Bar
           UINavigationBar.appearance().shadowImage = UIImage()
           UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
           UINavigationBar.appearance().barTintColor = .white
           UINavigationBar.appearance().tintColor = AppTheme.primaryColor
           UINavigationBar.appearance().isTranslucent = false
           UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor :
               AppTheme.primaryColor, NSAttributedString.Key.font : UIFont(name: FontName.Bold, size: 20)!]
       }
}

