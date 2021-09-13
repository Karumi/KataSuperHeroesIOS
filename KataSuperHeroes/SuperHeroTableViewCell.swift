import Foundation
import UIKit
import SDWebImage

class SuperHeroTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    public static var reuseIdentifier: String { return String(describing: SuperHeroTableViewCell.self) + "ReuseIdentifier" }
    public static var identifier: String { return String(describing: SuperHeroTableViewCell.self) + "Identifier" }

    func configure(forItem item: SuperHero) {
        nameLabel.text = item.name
        photoImageView.sd_setImage(with: item.photo)
        avengersBadgeImageView.isHidden = !item.isAvenger
        avengersBadgeImageView.accessibilityLabel = "\(item.name) - Avengers Badge"
        accessibilityLabel = item.name
        applyImageGradient(photoImageView)
    }

    private func applyImageGradient(_ thumbnailImage: UIImageView) {
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
