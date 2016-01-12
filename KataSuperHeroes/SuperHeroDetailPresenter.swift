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

    init(ui: SuperHeroDetailUI, superHeroName: String) {
        self.ui = ui
        self.superHeroName = superHeroName
    }

    func viewDidLoad() {
        
    }

}

protocol SuperHeroDetailUI: BothamUI, BothamLoadingUI {

}