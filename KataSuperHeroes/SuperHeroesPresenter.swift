//
//  SuperHeroesPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class SuperHeroesPresenter: BothamPresenter {

    private let ui: SuperHeroesUI
    private let getSuperHeroes: GetSuperHeroes

    init(ui: SuperHeroesUI, getSuperHeroes: GetSuperHeroes) {
        self.ui = ui
        self.getSuperHeroes = getSuperHeroes
    }

    func viewDidLoad() {

    }
}

protocol SuperHeroesUI : BothamLoadingUI {

}
