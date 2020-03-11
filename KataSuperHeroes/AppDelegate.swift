//
//  AppDelegate.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame:UIScreen.main.bounds)
            installRootViewControllerIntoWindow(window)
            configureWindow()
            configureNavigationBarStyle()
            window?.makeKeyAndVisible()
            return true
    }

    fileprivate func installRootViewControllerIntoWindow(_ window: UIWindow?) {
        let viewController = ServiceLocator().provideRootViewController()
        window?.rootViewController = viewController
    }

    fileprivate func configureWindow() {
        window?.backgroundColor = UIColor.windowBackgroundColor
    }

    fileprivate func configureNavigationBarStyle() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.navigationBarColor
        navigationBarAppearance.tintColor = UIColor.navigationBarTitleColor
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.navigationBarTitleColor
        ]
    }
}
