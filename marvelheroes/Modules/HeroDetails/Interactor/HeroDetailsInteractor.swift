//
//  HeroDetailsInteractor.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

class HeroDetailsInteractor: HeroDetailsUseCase {
    var output: HeroDetailsInteractorOutput!
    
    func fetchHeroDetails(id: Int) {
        HeroDefaultService().getHeroDetails(characterId: id, completion: { result in
            switch result {
            case .success(let hero):
                if let hero = hero {
                    self.output.heroDetailsFetched(hero)
                } else {
                    self.output.heroDetailsFailed()
                }
            case .error:
                self.output.heroDetailsFailed()
            }
        })
    }
    
}
