//
//  SuperHeroesKataViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class KataSuperHeroesViewController: BothamViewController, BothamLoadingViewController {

    let loadingView: UIView = {
        let loadingView = BothamLoadingView()
        loadingView.color = UIColor.loadingColor
        return loadingView
    }()

}