//
//  HeroService.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 15/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

struct HeroService: HeroServiceProtocol {
    func getHeroesList(completion: @escaping (Result<[Hero]>) -> Void) {
        HeroDefaultService().requestGetHeroesList(completion: { result in
            switch result {
            case .success(let heroData):
                let heroesList = heroData.asList()
                completion(Result(value: heroesList))
            case .error(let error):
                completion(Result(error: error))
            }
        })
    }
    
    func getHeroDetails(characterId: Int, completion: @escaping (Result<Hero?>) -> Void) {
        HeroDefaultService().requestGetHeroDetails(characterId: characterId, completion: { result in
            switch result {
            case .success(let heroData):
                let hero = heroData.asEntity()
                completion(Result(value: hero))
            case .error(let error):
                completion(Result(error: error))
            }
        })
    }
}
