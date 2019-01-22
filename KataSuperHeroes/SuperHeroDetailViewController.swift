//
//  SuperHeroDetailViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SuperHeroDetailViewController: KataSuperHeroesViewController, SuperHeroDetailUI {

    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var presenter: SuperHeroDetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func show(superHero: SuperHero?) {
        guard let superHero = superHero else {
            return
        }
        userLabel.text = superHero.name
        userLabel.accessibilityLabel = "Name: \(superHero.name)"
        userLabel.isHidden = false
        descriptionLabel.text = superHero.description
        descriptionLabel.accessibilityLabel = "Description: \(superHero.name)"
        descriptionLabel.isHidden = false
        photoImageView.sd_setImage(with: superHero.photo)
        avengersBadgeImageView.isHidden = !superHero.isAvenger
    }
}
