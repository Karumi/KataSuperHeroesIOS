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

        tester().waitForView(withAccessibilityLabel: "¯\\_(ツ)_/¯")
    }

    func testShowsSuperHeroNamesIfThereAreSuperHeroes() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        assertSuperHerosDisplayed(superHeroes)
    }
    

    func testShowsAvengersBadgeIfASuperHeroIsPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeAvengers()

        openSuperHeroesViewController()

        assertAvengersDisplayed(superHeroes)
    }

    func testDoNotShowAvengersBadgeIfSuperHeroesAreNotPartOfTheAvengersTeam() {
        let superHeroes = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        assertNonAvengersDisplayed(superHeroes)
    }

    func testDoNotShowEmptyCaseIfThereAreSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForAbsenceOfView(withAccessibilityLabel: "¯\\_(ツ)_/¯")
    }

    func testDoNotShowLoadingViewIfThereAreSomeSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes()

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
}

private extension SuperHeroesViewControllerTests {
    func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
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

    @discardableResult
    func openSuperHeroesViewController() -> SuperHeroesViewController {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(ui: superHeroesViewController,
                getSuperHeroes: GetSuperHeroes(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
        return superHeroesViewController
    }
    

    
    func assertSuperHerosDisplayed(_ superHeroes: [SuperHero]) {
        assertSuperHerosDisplayed(superHeroes) { cell, hero in
            expect(cell.nameLabel.text).to(equal(hero.name))
        }
    }
    
    func assertAvengersDisplayed(_ superHeroes: [SuperHero]) {
        assertSuperHerosDisplayed(superHeroes) { cell, _ in
            expect(cell.avengersBadgeImageView.isHidden).to(beFalse())
        }
    }
    
    func assertNonAvengersDisplayed(_ superHeroes: [SuperHero]) {
        assertSuperHerosDisplayed(superHeroes) { cell, _ in
            expect(cell.avengersBadgeImageView.isHidden).to(beTrue())
        }
    }
    
    private func assertSuperHerosDisplayed(
        _ superHeroes: [SuperHero],
        assert: ((SuperHeroTableViewCell, SuperHero) -> Void)
    ) {
        for i in 0..<superHeroes.count {
            let superHeroCell = getSuperHeroTableViewCell(atIndex: i)
            assert(superHeroCell, superHeroes[i])
        }
    }
    
    private func getSuperHeroTableViewCell(atIndex row: Int) -> SuperHeroTableViewCell {
        let indexPath = IndexPath(row: row, section: 0)
        let cell = tester().waitForCell(
            at: indexPath,
            inTableViewWithAccessibilityIdentifier: "SuperHeroesTableView")
        return cell as! SuperHeroTableViewCell
    }
}
