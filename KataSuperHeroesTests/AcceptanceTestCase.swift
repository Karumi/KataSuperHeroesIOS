import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {

    private var originalRootViewController: UIViewController?
    private var rootViewController: UIViewController? {
        get {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController
        }

        set(newRootViewController) {
            UIApplication.shared
                .windows
                .first { $0.isKeyWindow }?
                .rootViewController = newRootViewController
        }
    }

    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }

    func present(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
}
