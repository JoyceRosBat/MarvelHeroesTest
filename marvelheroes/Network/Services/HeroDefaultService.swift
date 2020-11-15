//
//  HeroeDefaultService.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation
import Moya

struct HeroDefaultService {
    let provider: MoyaProvider<HeroNetworkServiveAPI>
    
    init(provider: MoyaProvider<HeroNetworkServiveAPI> = MoyaProvider<HeroNetworkServiveAPI>()) {
        self.provider = provider
    }
}
