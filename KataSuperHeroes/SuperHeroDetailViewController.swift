//
//  SuperHeroDetailViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import SDWebImage

class SuperHeroDetailViewController: KataSuperHeroesViewController, SuperHeroDetailUI {

    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func showSuperHero(superHero: SuperHero) {
        userLabel.text = superHero.name
        descriptionLabel.text = superHero.description
        photoImageView.sd_setImageWithURL(superHero.photo)
        avengersBadgeImageView.hidden = !superHero.isAvenger
    }
}