import UIKit

class SuperHeroesViewController: KataSuperHeroesViewController, SuperHeroesUI {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCaseView: UILabel!

    var presenter: SuperHeroesPresenter!
    var dataSource: SuperHeroesTableDataSource!
    var delegate: UITableViewDelegate!

    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.tableFooterView = UIView()
        tableView.accessibilityLabel = "SuperHeroesTableView"
        tableView.accessibilityIdentifier = "SuperHeroesTableView"
        configureNavigationBarBackButton()
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func showEmptyCase() {
        emptyCaseView.isHidden = false
    }

    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController) {
        navigationController?.pushViewController(superHeroDetailViewController, animated: true)
    }

    func show(items: [SuperHero]) {
        dataSource.items = items
        tableView.reloadData()
    }

    private func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}
