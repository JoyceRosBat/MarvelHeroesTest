//
//  HeroDefaultServiceProtocol.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

protocol HeroDefaultServiceProtocol {
    func getHeroesList(completion: @escaping (Result<[Hero]>) -> Void)
    func getHeroDetails(characterId: Int, completion: @escaping (Result<Hero?>) -> Void)
}
