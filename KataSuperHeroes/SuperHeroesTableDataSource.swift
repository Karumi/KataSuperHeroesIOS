import UIKit

class SuperHeroesTableDataSource: NSObject, UITableViewDataSource {
    open var items = [SuperHero]()

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuperHeroTableViewCell.identifier, for: indexPath)
        let item = items[indexPath.item]
        (cell as! SuperHeroTableViewCell).configure(forItem: item)
        return cell
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
