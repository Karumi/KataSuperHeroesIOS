import Foundation
import UIKit

class ServiceLocator {

    func provideRootViewController() -> UIViewController {
        let navigationController: UINavigationController = storyBoard.initialViewController()
        navigationController.viewControllers = [provideSuperHeroesViewController()]
        return navigationController
    }

    func provideSuperHeroesViewController() -> UIViewController {
        let superHeroesViewController: SuperHeroesViewController =
        storyBoard.instantiateViewController("SuperHeroesViewController")
        let presenter = provideSuperHeroesPresenter(superHeroesViewController)
        let dataSource = provideSuperHeroesDataSource()
        superHeroesViewController.presenter = presenter
        superHeroesViewController.dataSource = dataSource
        superHeroesViewController.delegate =
            SuperHeroesTableViewDelegate(dataSource: dataSource, presenter: presenter)
        return superHeroesViewController
    }

    func provideSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let viewController: SuperHeroDetailViewController =
        storyBoard.instantiateViewController("SuperHeroDetailViewController")
        viewController.presenter = provideSuperHeroDetailPresenter(viewController, superHeroName: superHeroName)
        return viewController
    }

    private func provideSuperHeroDetailPresenter(_ ui: SuperHeroDetailUI,
        superHeroName: String) -> SuperHeroDetailPresenter {
        let getSuperHeroByName = GetSuperHeroByName(repository: SuperHeroesRepository())
        return SuperHeroDetailPresenter(ui: ui, superHeroName: superHeroName, getSuperHeroByName: getSuperHeroByName)
    }

    private func provideSuperHeroesDataSource() -> SuperHeroesTableDataSource {
        return SuperHeroesTableDataSource()
    }

    private func provideSuperHeroesPresenter(_ ui: SuperHeroesUI) -> SuperHeroesPresenter {
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        return SuperHeroesPresenter(ui: ui, getSuperHeroes: getSuperHeroes)
    }

    private func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        return GetSuperHeroes(repository: SuperHeroesRepository())
    }

    private lazy var storyBoard: KataSuperHeroesStoryboard = {
        return KataSuperHeroesStoryboard(name: "SuperHeroes")
    }()

}
