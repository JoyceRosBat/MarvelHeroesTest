//
//  MRVKeys.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

enum MRVKeys: String {
    case api = "API_KEY"
    case hash = "HASH_KEY"
    
    var key: String {
        return self.rawValue
    }
}
