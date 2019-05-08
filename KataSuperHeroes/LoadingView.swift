import UIKit

@IBDesignable
open class LoadingView: UIView {
    private var view: UIView!
    @IBOutlet open weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet open weak var loadingLabel: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    private func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        accessibilityLabel = "LoadingView"
    }

    private func loadViewFromNib() -> UIView {
        return Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self)![0] as! UIView
    }

    @IBInspectable open var color: UIColor? = nil {
        didSet {
            activityIndicator.color = color
            loadingLabel.textColor = color
        }
    }
}
