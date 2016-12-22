//
//  GetSuperHeroByName.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class GetSuperHeroByName {

    fileprivate let repository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        self.repository = repository
    }

    func execute(_ superHeroName: String, completion: @escaping (SuperHero?) -> () ) {
        repository.getSuperHero(withName: superHeroName) { superHero in
            completion(superHero)
        }
    }

}
