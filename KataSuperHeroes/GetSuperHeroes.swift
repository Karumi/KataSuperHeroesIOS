//
//  GetSuperHeroes.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class GetSuperHeroes {

    fileprivate let repository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        self.repository = repository
    }

    func execute(_ completion: @escaping ([SuperHero]) -> ()) {
        repository.getAll() { superHeroes in
            completion(superHeroes)
        }
    }
}
