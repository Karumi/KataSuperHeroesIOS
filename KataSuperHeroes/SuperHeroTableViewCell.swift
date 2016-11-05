//
//  SuperHeroTableViewCell.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import SDWebImage

class SuperHeroTableViewCell: UITableViewCell, BothamViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    func configure(forItem item: SuperHero) {
        nameLabel.text = item.name
        photoImageView.sd_setImage(with: item.photo as URL!)
        avengersBadgeImageView.isHidden = !item.isAvenger
        avengersBadgeImageView.accessibilityLabel = "\(item.name) - Avengers Badge"
        applyImageGradient(photoImageView)
    }

    fileprivate func applyImageGradient(_ thumbnailImage: UIImageView) {
        guard thumbnailImage.layer.sublayers == nil else {
            return
        }
        let gradient: CAGradientLayer = CAGradientLayer(layer: thumbnailImage.layer)
        gradient.frame = thumbnailImage.bounds
        gradient.colors = [UIColor.gradientStartColor.cgColor, UIColor.gradientEndColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.6)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        thumbnailImage.layer.insertSublayer(gradient, at: 0)
    }

}
