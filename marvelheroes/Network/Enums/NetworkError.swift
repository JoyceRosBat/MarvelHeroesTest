//
//  NetworkError.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation
import Moya

enum NetworkError: String, Error {

    case parsing
    case unauthorized
    case server
    case unknown

    var message: String {
        switch self {
        case .parsing:
            return ErrorMessage.parsing.rawValue
        case .unauthorized:
            return ErrorMessage.unauthorized.rawValue
        case .server:
            return ErrorMessage.server.rawValue
        default:
            return ErrorMessage.unknown.rawValue
        }
    }
    
    static func from(_ error: Error) -> NetworkError {
        if let moyaError = error as? MoyaError {
            switch moyaError {
            case .imageMapping, .jsonMapping, .stringMapping, .objectMapping:
                return .parsing

            case .statusCode(let response):
                switch response.statusCode {
                case 400, 401:
                    return .unauthorized
                case 500:
                    return .server
                default:
                    return .unknown
                }
            default:
                return .unknown
            }
        } else {
            return .unknown
        }
    }
}
