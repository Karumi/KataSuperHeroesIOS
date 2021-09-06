import Combine
import Foundation

class SuperHeroDetailPresenter {
    private weak var ui: SuperHeroDetailUI?
    private let superHeroName: String
    private let getSuperHeroByName: GetSuperHeroByName
    private var subscriptions = Set<AnyCancellable>()

    init(ui: SuperHeroDetailUI, superHeroName: String, getSuperHeroByName: GetSuperHeroByName) {
        self.ui = ui
        self.superHeroName = superHeroName
        self.getSuperHeroByName = getSuperHeroByName
    }

    func viewDidLoad() {
        ui?.title = superHeroName
        ui?.showLoader()
        getSuperHeroByName
            .execute(superHeroName)
            .sink { superHero in
                self.ui?.hideLoader()
                self.ui?.show(superHero: superHero)
            }
            .store(in: &subscriptions)
    }
}

protocol SuperHeroDetailUI: AnyObject {
    func showLoader()
    func hideLoader()
    var title: String? { get set }
    func show(superHero: SuperHero?)
}
