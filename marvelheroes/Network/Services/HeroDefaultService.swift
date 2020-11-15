//
//  HeroeDefaultService.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation
import Moya

struct HeroDefaultService: HeroDefaultServiceProtocol {
    
    let provider: MoyaProvider<HeroNetworkServiveAPI>
    
    init(provider: MoyaProvider<HeroNetworkServiveAPI> = MoyaProvider<HeroNetworkServiveAPI>()) {
        self.provider = provider
    }
    
    func sendRequest<T: Codable>(_ request: HeroNetworkServiveAPI, completion: @escaping (Result<T>) -> Void) {
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
    
    func requestGetHeroesList(completion: @escaping (Result<HeroData>) -> Void) {
        let request = HeroNetworkServiveAPI.getHeroesList
        sendRequest(request, completion: completion)
    }
    
    func requestGetHeroDetails(characterId: Int, completion: @escaping (Result<HeroData>) -> Void) {
        let request = HeroNetworkServiveAPI.getHeroeDetails(characterId: characterId)
        sendRequest(request, completion: completion)
    }
}
