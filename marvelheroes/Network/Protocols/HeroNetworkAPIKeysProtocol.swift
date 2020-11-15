//
//  HeroNetworkAPIKeysProtocol.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

protocol HeroNetworkAPIKeysProtocol {
    func getMRVApiKey() -> String
    func getMRVHash() -> String
}
