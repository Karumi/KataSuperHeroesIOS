import Foundation
@testable import KataSuperHeroes
import KIF
import Nimble
import UIKit

class SuperHeroesViewControllerTests: AcceptanceTestCase {
    private let repository = MockSuperHeroesRepository()

    func testShowsEmptyCaseIfThereAreNoSuperHeroes() {
        givenThereAreNoSuperHeroes()

        openSuperHeroesViewController()

        tester().waitForView(withAccessibilityLabel: "¯\\_(ツ)_/¯")
    }
}

private extension SuperHeroesViewControllerTests {
    func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
                                      avengers: Bool = false) -> [SuperHero]
    {
        var superHeroes = [SuperHero]()
        for i in 0 ..< numberOfSuperHeroes {
            let superHero = SuperHero(
                name: "SuperHero - \(i)",
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
        superHeroesViewController.presenter = SuperHeroesPresenter(
            ui: superHeroesViewController,
            getSuperHeroes: GetSuperHeroes(repository: repository))
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
        return superHeroesViewController
    }
}
