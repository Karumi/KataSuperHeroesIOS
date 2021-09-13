import Foundation
import Combine

@testable import KataSuperHeroes

class MockSuperHeroesRepository: SuperHeroesRepository {
    var superHeroes = [SuperHero]()

    override func getAll() -> AnyPublisher<[SuperHero], Never> {
        Just(superHeroes).eraseToAnyPublisher()
    }

    override func getSuperHero(
        withName name: String
    ) -> AnyPublisher<SuperHero?, Never> {
        let superHeroByName = superHeroes.filter { $0.name == name }.first!
        return Just(superHeroByName).eraseToAnyPublisher()
    }

}
