//
//  SuperHeroesViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
import BothamUI

class SuperHeroesViewController: KataSuperHeroesViewController, BothamTableViewController, SuperHeroesUI {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCaseView: UILabel!

    var dataSource: BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell>!
    var delegate: UITableViewDelegate!

    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.tableFooterView = UIView()
        tableView.accessibilityLabel = "SuperHeroesTableView"
        tableView.accessibilityIdentifier = "SuperHeroesTableView"
        configureNavigationBarBackButton()
        super.viewDidLoad()
    }

    func showEmptyCase() {
        emptyCaseView.isHidden = false
    }

    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController) {
        navigationController?.push(viewController: superHeroDetailViewController)
    }

    fileprivate func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}
