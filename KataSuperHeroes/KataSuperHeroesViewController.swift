import UIKit

class KataSuperHeroesViewController: UIViewController {

    let loadingView: UIView = {
        let loadingView = LoadingView()
        loadingView.color = UIColor.loadingColor
        return loadingView
    }()

    func showLoader() {
        guard !view.subviews.contains(loadingView) else {
            return
        }

        loadingView.isHidden = false
        loadingView.bounds = view.bounds
        loadingView.autoresizingMask = [
            .flexibleBottomMargin,
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin
        ]

        view.addSubview(loadingView)
    }

    func hideLoader() {
        loadingView.removeFromSuperview()
        loadingView.isHidden = true
    }
}
