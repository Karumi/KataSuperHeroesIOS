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
import UIKit
@testable import KataSuperHeroes

class SuperHeroesViewControllerTests: AcceptanceTestCase {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsEmptyCaseIfThereAreNoSuperHeroes() {
        givenThereAreNoSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForView(withAccessibilityLabel: "¯\\_(ツ)_/¯")
    }

    func testShowsSuperHeroNamesIfThereAreSuperHeroes() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let superHeroCell = tester().waitForView(withAccessibilityLabel: superHeroes[i].name)
                as! SuperHeroTableViewCell

            expect(superHeroCell.nameLabel.text).to(equal(superHeroes[i].name))
        }
    }

    func testShowsAvengersBadgeIfASuperHeroIsPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeAvengers()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let avengersBadge = tester()
                .waitForView(withAccessibilityLabel: "\(superHeroes[i].name) - Avengers Badge")
        }
    }

    func testDoNotShowAvengersBadgeIfSuperHeroesAreNotPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let superHeroCell = tester().waitForView(withAccessibilityLabel: superHeroes[i].name)
                as! SuperHeroTableViewCell
        }
    }

    func testDoNotShowEmptyCaseIfThereAreSuperHeroes() {
        givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForAbsenceOfView(withAccessibilityLabel: "¯\\_(ツ)_/¯")
    }

    func testDoNotShowLoadingViewIfThereAreSomeSuperHeroes() {
        givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForAbsenceOfView(withAccessibilityLabel: "LoadingView")
    }

    func testShowsTheExactNumberOfSuperHeroes() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        let tableView = tester().waitForView(withAccessibilityLabel: "SuperHeroesTableView") as! UITableView
        expect(tableView.numberOfRows(inSection: 0)).to(equal(superHeroes.count))
    }

    func testOpensSuperHeroDetailViewControllerOnSuperHeroTapped() {
        let superHeroIndex = 1
        let superHeroes = givenThereAreSomeSuperHeroes()
        let superHero = superHeroes[superHeroIndex]
        openSuperHeroesViewController()

        tester().waitForView(withAccessibilityLabel: superHero.name)
        tester().tapRow(at: IndexPath(row: superHeroIndex, section: 0),
            inTableViewWithAccessibilityIdentifier: "SuperHeroesTableView")

        tester().waitForView(withAccessibilityLabel: superHero.name)
    }

    fileprivate func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
        avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: NSURL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg") as URL?,
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func openSuperHeroesViewController() {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(ui: superHeroesViewController,
                getSuperHeroes: GetSuperHeroes(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]
        presentViewController(rootViewController)
        tester().waitForAnimationsToFinish()
    }
}
