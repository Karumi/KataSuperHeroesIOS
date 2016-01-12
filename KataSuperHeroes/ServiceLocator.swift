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

    private func provideSuperHeroesViewController() -> UIViewController {
        let superHeroesViewController: SuperHeroesViewController = storyBoard.instantiateViewController("SuperHeroesViewController")
        superHeroesViewController.presenter = provideSuperHeroesPresenter(superHeroesViewController)
        return superHeroesViewController

    }

    private func provideSuperHeroesPresenter(ui: SuperHeroesUI) -> SuperHeroesPresenter {
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        return SuperHeroesPresenter(ui: ui , getSuperHeroes: getSuperHeroes)
    }

    private func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        return GetSuperHeroes()
    }

    private lazy var storyBoard : BothamStoryboard = {
        return BothamStoryboard(name: "SuperHeroes")
    }()

}