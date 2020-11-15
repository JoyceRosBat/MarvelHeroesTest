//
//  HeroeDefaultService.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation
import Alamofire
import Moya

protocol HeroDefaultServiceProtocol {
    func getHeroesList(completion: @escaping (Result<Hero>) -> Void)
    func getHeroeDetails(id: Int, completion: @escaping (Result<Hero>) -> Void)
}

protocol HeroDefaultServiceRequestProtocol {
    func requestGetHeroesList(completion: @escaping (Result<Hero>) -> Void)
    func requestGetHeroeDetails(id: Int, completion: @escaping (Result<Hero>) -> Void)
}

struct HeroDefaultService {
    private let provider = MoyaProvider<HeroeNetworkServiveAPI>
    
    init(provider: MoyaProvider<HeroeNetworkServiveAPI> = MoyaProvider<HeroeNetworkServiveAPI>()) {
        self.provider = provider
    }
}

extension HeroDefaultService {
    
    private func sendRequest(_ request: HeroeNetworkServiveAPI, completion: @escaping (Result<T>) -> Void) {
        provider.request(request) { result in
            switch result {
            case .success(let response):
                do {
                    let object: T = try request.serializer.map(responseData: response)
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

private extension HeroDefaultService: HeroDefaultServiceRequestProtocol {
    func requestGetHeroesList(completion: @escaping (Result<Hero>) -> Void) {
        let request = HeroeNetworkServiveAPI.getHeroesList
        sendRequest(request, completion: completion)
    }
    
    func requestGetHeroeDetails(id: Int, completion: @escaping (Result<Hero>) -> Void) {
        let request = HeroeNetworkServiveAPI.getHeroeDetails(id: id)
        sendRequest(request, completion: completion)
    }
}

extension HeroDefaultService: HeroDefaultServiceProtocol {
    func getHeroesList(completion: @escaping (Result<Hero>) -> Void) {
        requestGetHeroesList(completion: { result in
            switch result {
            case .success(let hero):
                completion(Result(value: hero))
            case .error(let error):
                completion(Result(value: error))
            }
        })
    }
    
    func getHeroeDetails(id: Int, completion: @escaping (Result<Hero>) -> Void) {
        requestGetHeroesDetails(id: id, completion: { result in
            switch result {
            case .success(let hero):
                completion(Result(value: hero))
            case .error(let error):
                completion(Result(value: error))
            }
        })
    }
}
