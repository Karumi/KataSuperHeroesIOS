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

    func configureForItem(item: SuperHero) {
        nameLabel.text = item.name
        nameLabel.accessibilityLabel = item.name
        photoImageView.sd_setImageWithURL(item.photo)
        applyImageGradient(photoImageView)
    }

    private func applyImageGradient(thumbnailImage: UIImageView) {
        guard thumbnailImage.layer.sublayers == nil else {
            return
        }
        let gradient: CAGradientLayer = CAGradientLayer(layer: thumbnailImage.layer)
        gradient.frame = thumbnailImage.bounds
        gradient.colors = [UIColor.gradientStartColor.CGColor, UIColor.gradientEndColor.CGColor]
        gradient.startPoint = CGPointMake(0.0, 0.6)
        gradient.endPoint = CGPointMake(0.0, 1.0)
        thumbnailImage.layer.insertSublayer(gradient, atIndex: 0)
    }

}