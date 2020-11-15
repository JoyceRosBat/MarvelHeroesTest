//
//  Hero+Ext.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 15/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

extension HeroData: EntityConvertableProtocol {
    func asList() -> [Hero] {
        guard let data = self.data else { return [] }
        guard let heroesList = data.results.map({ $0 }) else { return [] }
        return heroesList
    }
    
    func asEntity() -> Hero? {
        guard let data = self.data else { return nil }
        guard let hero = data.results?.first else { return nil }
        return hero
    }
}
