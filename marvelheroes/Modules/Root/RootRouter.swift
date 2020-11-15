//
//  RootRouter.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

class RootRouter: RootRouterProtocol {
    
    func presentHeroesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = HeroRouter.assembleModule()
    }
}
