//
//  RootWireframe.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class ServiceLocator {

    func provideRootViewController() -> UIViewController {
        let navigationController: UINavigationController = storyBoard.initialViewController()
        navigationController.viewControllers = [provideSuperHeroesViewController()]
        return navigationController
    }

    func provideSuperHeroDetailPresenter(superHeroName: String) -> UIViewController {
        let viewController: SuperHeroDetailViewController = storyBoard.instantiateViewController("SuperHeroDetailViewController")
        viewController.presenter = provideSuperHeroDetailPresenter(viewController, superHeroName: superHeroName)
        return viewController
    }

    private func provideSuperHeroDetailPresenter(ui: SuperHeroDetailUI, superHeroName: String) -> SuperHeroDetailPresenter {
        return SuperHeroDetailPresenter(ui: ui, superHeroName: superHeroName)
    }

    private func provideSuperHeroesViewController() -> UIViewController {
        let superHeroesViewController: SuperHeroesViewController = storyBoard.instantiateViewController("SuperHeroesViewController")
        let presenter = provideSuperHeroesPresenter(superHeroesViewController)
        let dataSource = provideSuperHeroesDataSource()
        superHeroesViewController.presenter = presenter
        superHeroesViewController.dataSource = dataSource
        superHeroesViewController.delegate = BothamTableViewNavigationDelegate(dataSource: dataSource, presenter: presenter)
        return superHeroesViewController
    }

    private func provideSuperHeroesDataSource() -> BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell> {
        return BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell>()
    }

    private func provideSuperHeroesPresenter(ui: SuperHeroesUI) -> SuperHeroesPresenter {
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        return SuperHeroesPresenter(ui: ui , getSuperHeroes: getSuperHeroes, serviceLocator: self)
    }

    private func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        return GetSuperHeroes(repository: SuperHeroesRepository())
    }

    private lazy var storyBoard : BothamStoryboard = {
        return BothamStoryboard(name: "SuperHeroes")
    }()

}