//
//  HeroPresenter.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

class HeroPresenter: HeroPresenterProtocol {
    var view: HeroesViewProtocol?
    var interactor: HeroUseCase!
    var router: HeroRouterProtocol!
    
    var heroes: [Hero] = [] {
        didSet {
            if heroes.count > 0 {
                view?.showHeroesData(heroes)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchHeroes()
    }
    
    func didSelectHero(_ hero: Hero) {
        router.presentDetails(forHero: hero)
    }
}

extension HeroPresenter: HeroInteractorOutput {
    func heroesFetched(_ heroes: [Hero]) {
        self.heroes = heroes
        self.view?.showHeroesData(heroes)
    }
    
    func heroesFailed() {
        self.view?.showNoContentScreen()
    }
}
