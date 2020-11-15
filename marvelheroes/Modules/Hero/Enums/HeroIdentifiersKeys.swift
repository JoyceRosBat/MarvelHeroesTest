//
//  HeroIdentifiersKeys.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

enum HeroIdentifiersKeys: String {
    case heroStoryboard = "Hero"
    case heroViewController = "HeroViewController"
    case heroesCollectionViewCell = "HeroesCollectionViewCell"
    
    var key: String {
        return self.rawValue
    }
}
