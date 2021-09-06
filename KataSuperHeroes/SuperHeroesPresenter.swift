import UIKit
import Combine

class SuperHeroesPresenter {
    private weak var ui: SuperHeroesUI?
    private let getSuperHeroes: GetSuperHeroes
    private var subscriptions = Set<AnyCancellable>()

    init(ui: SuperHeroesUI, getSuperHeroes: GetSuperHeroes) {
        self.ui = ui
        self.getSuperHeroes = getSuperHeroes
    }

    func viewDidLoad() {
        ui?.showLoader()
        getSuperHeroes
            .execute()
            .receive(on: RunLoop.main)
            .sink { superHeroes in
                self.ui?.hideLoader()
                if superHeroes.isEmpty {
                    self.ui?.showEmptyCase()
                } else {
                    self.ui?.show(items: superHeroes)
                }
            }.store(in: &subscriptions)
    }

    func itemWasTapped(_ item: SuperHero) {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(item.name)
        ui?.openSuperHeroDetailScreen(superHeroDetailViewController)
    }
}

protocol SuperHeroesUI: AnyObject {
    func showLoader()
    func hideLoader()
    func showEmptyCase()
    func show(items: [SuperHero])
    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController)

}
