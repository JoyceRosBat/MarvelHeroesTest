//
//  HeroDefaultServiceProtocol.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

protocol HeroDefaultServiceProtocol {
    func sendRequest<T: Codable>(_ request: HeroNetworkServiveAPI, completion: @escaping (Result<T>) -> Void)
    func requestGetHeroesList(completion: @escaping (Result<HeroData>) -> Void)
    func requestGetHeroDetails(characterId: Int, completion: @escaping (Result<HeroData>) -> Void)
}
