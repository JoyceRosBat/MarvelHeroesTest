//
//  HeroServiceProtocol.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 15/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

protocol HeroServiceProtocol {
    func getHeroesList(completion: @escaping (Result<[Hero]>) -> Void)
    func getHeroDetails(characterId: Int, completion: @escaping (Result<Hero?>) -> Void)
}
