//
//  SuperHeroesPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class SuperHeroesPresenter: BothamPresenter, BothamNavigationPresenter {

    fileprivate weak var ui: SuperHeroesUI?
    fileprivate let getSuperHeroes: GetSuperHeroes

    init(ui: SuperHeroesUI, getSuperHeroes: GetSuperHeroes) {
        self.ui = ui
        self.getSuperHeroes = getSuperHeroes
    }

    func viewDidLoad() {
        ui?.showLoader()
        getSuperHeroes.execute { superHeroes in
            self.ui?.hideLoader()
            if superHeroes.isEmpty {
                self.ui?.showEmptyCase()
            } else {
                self.ui?.show(items: superHeroes)
            }
        }
    }

    func itemWasTapped(_ item: SuperHero) {
        let superHeroDetailViewController = ServiceLocator().provideSuperHeroDetailViewController(item.name)
        ui?.openSuperHeroDetailScreen(superHeroDetailViewController)
    }
}

protocol SuperHeroesUI: BothamLoadingUI {

    func showEmptyCase()
    func show(items: [SuperHero])
    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController)

}
