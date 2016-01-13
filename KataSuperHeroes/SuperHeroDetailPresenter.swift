//
//  SuperHeroDetailPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class SuperHeroDetailPresenter: BothamPresenter {

    private weak var ui: SuperHeroDetailUI?
    private let superHeroName: String
    private let getSuperHeroByName: GetSuperHeroByName

    init(ui: SuperHeroDetailUI, superHeroName: String, getSuperHeroByName: GetSuperHeroByName) {
        self.ui = ui
        self.superHeroName = superHeroName
        self.getSuperHeroByName = getSuperHeroByName
    }

    func viewDidLoad() {
        ui?.title = superHeroName
        ui?.showLoader()
        getSuperHeroByName.execute(superHeroName) { superHero in
            self.ui?.hideLoader()
            self.ui?.showSuperHero(superHero)
        }
    }

}

protocol SuperHeroDetailUI: BothamUI, BothamLoadingUI {

    var title: String? {get set}
    func showSuperHero(superHero: SuperHero?)

}