//
//  AcceptanceTestCase.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 13/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {

    private var originalRootViewController: UIViewController?
    private var rootViewController: UIViewController? {
        get {
            return UIApplication.sharedApplication().keyWindow?.rootViewController
        }

        set(newRootViewController) {
            UIApplication.sharedApplication().keyWindow?.rootViewController = newRootViewController
        }
    }

    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }

    func presentViewController(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
}