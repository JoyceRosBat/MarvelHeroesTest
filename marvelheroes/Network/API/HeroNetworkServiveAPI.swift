//
//  HeroeNetworkServiveAPI.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation
import Alamofire
import Moya

enum HeroNetworkServiveAPI {
    case getHeroesList
    case getHeroeDetails(characterId: Int)
}

extension HeroNetworkServiveAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: Endpoints.baseURL.path)!
    }
    
    var path: String {
        switch self {
        case .getHeroesList:
            return Endpoints.characters.path
        case .getHeroeDetails(let characterId):
            return Endpoints.characters(withId: characterId)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHeroesList,
             .getHeroeDetails:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    public var parameters: [String: Any]? {
        let params: [String: Any] = ["apikey": getMRVApiKey(), "ts": "1", "hash": getMRVHash()]
        switch self {
        default:
            return params
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        }
    }
}
