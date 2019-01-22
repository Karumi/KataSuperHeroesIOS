import UIKit

class SuperHeroesTableViewDelegate: NSObject, UITableViewDelegate {

    let dataSource: SuperHeroesTableDataSource
    let presenter: SuperHeroesPresenter

    init(dataSource: SuperHeroesTableDataSource, presenter: SuperHeroesPresenter) {
        self.dataSource = dataSource
        self.presenter = presenter
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.items[indexPath.item]
        presenter.itemWasTapped(item)
    }
}
