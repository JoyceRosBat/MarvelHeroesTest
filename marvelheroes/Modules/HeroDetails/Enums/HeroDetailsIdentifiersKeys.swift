//
//  HeroDetailsIdentifiersKeys.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

enum HeroDetailsIdentifiersKeys: String {
    case heroDetailsStoryboard = "HeroDetails"
    case heroDetailsViewController = "HeroDetailsViewController"
    
    var key: String {
        return self.rawValue
    }
}
