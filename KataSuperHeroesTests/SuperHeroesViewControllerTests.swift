//
//  SuperHeroesViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 13/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import KIF
import Nimble
@testable import KataSuperHeroes

class SuperHeroesViewControllerTests: AcceptanceTestCase {

    private let repository = MockSuperHeroesRepository()

    func testShowsEmptyCaseIfThereAreNoSuperHeroes() {
        openSuperHeroesViewController()

        let emptyCaseText = tester().waitForViewWithAccessibilityLabel("¯\\_(ツ)_/¯") as! UILabel

        expect(emptyCaseText.hidden).to(beFalse())
        expect(emptyCaseText.text).to(equal("¯\\_(ツ)_/¯"))
    }

    private func openSuperHeroesViewController() {
        let superHeroesViewController = ServiceLocator().provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(ui: superHeroesViewController,
                getSuperHeroes: GetSuperHeroes(repository: repository))
        presentViewController(superHeroesViewController)
    }
}