//
//  HeroInteractor.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

class HeroInteractor: HeroUseCase {
    var output: HeroInteractorOutput!
    
    func fetchHeroes() {
        HeroDefaultService().getHeroesList(completion: { result in
            switch result {
            case .success(let heroesList):
                self.output.heroesFetched(heroesList)
            case .error:
                self.output.heroesFailed()
            }
        })
    }
    
    
}
