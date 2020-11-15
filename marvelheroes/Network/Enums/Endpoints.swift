//
//  Endpoints.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

enum Endpoints: String {
    case baseURL = "https://gateway.marvel.com"
    case characters = "/v1/public/characters"
    
    var path: String {
        return self.rawValue
    }
    
    static func characters(withId id: Int) -> String {
        return Endpoints.characters.path + "/" + String(id)
    }
}

