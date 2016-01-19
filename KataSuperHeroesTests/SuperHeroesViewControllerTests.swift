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

    private let repository = MockSuperHeroesRepository()

    func testShowsEmptyCaseIfThereAreNoSuperHeroes() {
        givenThereAreNoSuperHeroes()

        openSuperHeroesViewController()

        let emptyCaseText = tester().waitForViewWithAccessibilityLabel("¯\\_(ツ)_/¯")
            as! UILabel
        expect(emptyCaseText.text).to(equal("¯\\_(ツ)_/¯"))
    }

    func testShowsSuperHeroNamesIfThereAreSuperHeroes() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let superHeroCell = tester().waitForViewWithAccessibilityLabel(superHeroes[i].name)
                as! SuperHeroTableViewCell

            expect(superHeroCell.nameLabel.text).to(equal(superHeroes[i].name))
        }
    }

    func testShowsAvengersBadgeIfASuperHeroIsPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeAvengers()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let avengersBadge = tester()
                .waitForViewWithAccessibilityLabel("\(superHeroes[i].name) - Avengers Badge")

            expect(avengersBadge.hidden).to(beFalse())
        }
    }

    func testDoNotShowAvengersBadgeIfSuperHeroesAreNotPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        for i in 0..<superHeroes.count {
            let superHeroCell = tester().waitForViewWithAccessibilityLabel(superHeroes[i].name)
                as! SuperHeroTableViewCell

            expect(superHeroCell.avengersBadgeImageView.hidden).to(beTrue())
        }
    }

    func testDoNotShowEmptyCaseIfThereAreSuperHeroes() {
        givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForAbsenceOfViewWithAccessibilityLabel("¯\\_(ツ)_/¯")
    }

    func testDoNotShowLoadingViewIfThereAreSomeSuperHeroes() {
        givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForAbsenceOfViewWithAccessibilityLabel("LoadingView")
    }

    func testShowsTheExactNumberOfSuperHeroes() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        let tableView = tester().waitForViewWithAccessibilityLabel("SuperHeroesTableView") as! UITableView
        expect(tableView.numberOfRowsInSection(0)).to(equal(superHeroes.count))
    }

    func testOpensSuperHeroDetailViewControllerOnSuperHeroTapped() {
        let superHeroIndex = 1
        let superHeroes = givenThereAreSomeSuperHeroes()
        let superHero = superHeroes[superHeroIndex]
        openSuperHeroesViewController()

        tester().waitForViewWithAccessibilityLabel(superHero.name)
        tester().tapRowAtIndexPath(NSIndexPath(forRow: superHeroIndex, inSection: 0),
            inTableViewWithAccessibilityIdentifier: "SuperHeroesTableView")

        tester().waitForViewWithAccessibilityLabel(superHero.name)
    }

    private func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    private func givenThereAreNoSuperHeroes() {
        givenThereAreSomeSuperHeroes(0)
    }

    private func givenThereAreSomeSuperHeroes(numberOfSuperHeroes: Int = 10,
        avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: NSURL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg"),
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    private func openSuperHeroesViewController() {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(ui: superHeroesViewController,
                getSuperHeroes: GetSuperHeroes(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]
        presentViewController(rootViewController)
    }
}