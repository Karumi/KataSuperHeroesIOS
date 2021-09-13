import Foundation
import Combine

class GetSuperHeroes {
    private let repository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[SuperHero], Never> {
        repository.getAll()
    }
}
