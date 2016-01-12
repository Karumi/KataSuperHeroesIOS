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

    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            window = UIWindow(frame:UIScreen.mainScreen().bounds)
            installRootViewControllerIntoWindow(window)
            configureWindow()
            configureNavigationBarStyle()
            window?.makeKeyAndVisible()
            return true
    }

    private func installRootViewControllerIntoWindow(window: UIWindow?) {
        let viewController = ServiceLocator().provideRootViewController()
        window?.rootViewController = viewController
    }

    private func configureWindow() {
        window?.backgroundColor = UIColor.windowBackgroundColor
    }

    private func configureNavigationBarStyle() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.navigationBarColor
        navigationBarAppearance.tintColor = UIColor.navigationBarTitleColor
        navigationBarAppearance.translucent = false
        navigationBarAppearance.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.navigationBarTitleColor
        ]
    }

}

