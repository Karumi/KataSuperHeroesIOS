//
//  SuperHeroDetailPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroDetailPresenter {

    fileprivate weak var ui: SuperHeroDetailUI?
    fileprivate let superHeroName: String
    fileprivate let getSuperHeroByName: GetSuperHeroByName

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
            self.ui?.show(superHero: superHero)
        }
    }

}

protocol SuperHeroDetailUI: class {
    func showLoader()
    func hideLoader()
    var title: String? {get set}
    func show(superHero: SuperHero?)

}
