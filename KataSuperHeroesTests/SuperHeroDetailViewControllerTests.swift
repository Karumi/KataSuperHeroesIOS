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

    private let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroNameAsTitle() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForViewWithAccessibilityLabel(superHero.name)
    }

    func testShowsSuperHeroName() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        let nameLabel = tester().waitForViewWithAccessibilityLabel("Name: \(superHero.name)") as! UILabel
        expect(nameLabel.text).to(equal(superHero.name))
    }

    func testShowsSuperHeroDescription() {
        let superHero = givenASuperHeroWithName()

        openSuperHeroDetailViewController(superHero.name)

        let nameLabel = tester().waitForViewWithAccessibilityLabel("Description: \(superHero.name)") as! UILabel
        expect(nameLabel.text).to(equal(superHero.description))
    }

    func testDoesNotShowAvengersBadgeIfTheHeroIsNotPartOfTheAvengersTeam() {
        let superHero = givenASuperHeroWithName(false)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForAbsenceOfViewWithAccessibilityLabel("Avengers Badge")
    }

    func testShowsAvengersBadgeIfTheSuperHeroIsPartOfTheAvengersTeam() {
        let superHero = givenASuperHeroWithName(true)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForViewWithAccessibilityLabel("Avengers Badge")
    }

    func testDoesNotShowLoadingViewOnceSuperHeroHasBeenLoaded() {
        let superHero = givenASuperHeroWithName(true)

        openSuperHeroDetailViewController(superHero.name)

        tester().waitForAbsenceOfViewWithAccessibilityLabel("LoadingView")
    }

    private func givenASuperHeroWithName(isAvenger: Bool = false) -> SuperHero {
        let superHero = SuperHero(name: "Mr. Clean",
            photo: NSURL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg"),
            isAvenger: isAvenger, description: "Description")
        repository.superHeroes = [superHero]
        return superHero
    }

    private func openSuperHeroDetailViewController(superHeroName: String) {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]
        presentViewController(rootViewController)
    }
}
