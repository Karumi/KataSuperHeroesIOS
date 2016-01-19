//
//  GetSuperHeroByName.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class GetSuperHeroByName {

    private let repository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        self.repository = repository
    }

    func execute(superHeroName: String, completion: (SuperHero?) -> () ) {
        repository.getSuperHeroeByName(superHeroName) { superHero in
            completion(superHero)
        }
    }

}