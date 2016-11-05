//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 13/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import KIF
import Nimble
import UIKit
@testable import KataSuperHeroes

class SuperHeroDetailViewControllerTests: AcceptanceTestCase {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroNameAsTitle() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForViewWithAccessibilityLabel(superHero.name)
    }

    func testShowsSuperHeroName() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForViewWithAccessibilityLabel("Name: \(superHero.name)")
    }

    func testShowsSuperHeroDescription() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForViewWithAccessibilityLabel("Description: \(superHero.name)")
    }

    func testDoesNotShowAvengersBadgeIfTheHeroIsNotPartOfTheAvengersTeam() {
        let superHero = givenASuperHeroWithName(false)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForAbsenceOfView(withAccessibilityLabel: "Avengers Badge")
    }

    func testShowsAvengersBadgeIfTheSuperHeroIsPartOfTheAvengersTeam() {
        let superHero = givenASuperHeroWithName(true)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForView(withAccessibilityLabel: "Avengers Badge")
    }

    func testDoesNotShowLoadingViewOnceSuperHeroHasBeenLoaded() {
        let superHero = givenASuperHeroWithName(true)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForAbsenceOfView(withAccessibilityLabel: "LoadingView")
    }

    fileprivate func givenASuperHeroWithName(_ isAvenger: Bool = false) -> SuperHero {
        let superHero = SuperHero(name: "Mr. Clean",
            photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg"),
            isAvenger: isAvenger, description: "Description")
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func openSuperHeroDetailViewController(_ superHeroName: String) {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]
        presentViewController(rootViewController)
        tester().waitForAnimationsToFinish()
    }
}
