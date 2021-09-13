import Foundation
import Combine

class GetSuperHeroByName {
    private let repository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        self.repository = repository
    }

    func execute(_ superHeroName: String) -> AnyPublisher<SuperHero?, Never> {
        repository.getSuperHero(withName: superHeroName)
    }
}
