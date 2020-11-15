//
//  EntityConvertableProtocol.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 15/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

protocol EntityConvertableProtocol {
    associatedtype EntityType
    func asList() -> [EntityType]
    func asEntity() -> EntityType?
}
