//
//  HeroDefaultService+Ext.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

extension HeroDefaultService: HeroDefaultServiceProtocol {
    func getHeroesList(completion: @escaping (Result<[Hero]>) -> Void) {
        requestGetHeroesList(completion: { result in
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
        requestGetHeroDetails(characterId: characterId, completion: { result in
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

extension HeroDefaultService {
    private func sendRequest<T: Codable>(_ request: HeroNetworkServiveAPI, completion: @escaping (Result<T>) -> Void) {
        provider.request(request) { result in
            switch result {
            case .success(let response):
                do {
                    let jsonDecoder = JSONDecoder()
                    let object: T = try jsonDecoder.decode(T.self, from: response.data)
                    completion(Result(value: object))
                } catch {
                    completion(Result(error: NetworkError.parsing))
                }
                
            case .failure(let error):
                completion(Result(error: NetworkError.from(error)))
            }
        }
    }
}

extension HeroDefaultService {
    private func requestGetHeroesList(completion: @escaping (Result<HeroData>) -> Void) {
        let request = HeroNetworkServiveAPI.getHeroesList
        sendRequest(request, completion: completion)
    }
    
    private func requestGetHeroDetails(characterId: Int, completion: @escaping (Result<HeroData>) -> Void) {
        let request = HeroNetworkServiveAPI.getHeroeDetails(characterId: characterId)
        sendRequest(request, completion: completion)
    }
}
