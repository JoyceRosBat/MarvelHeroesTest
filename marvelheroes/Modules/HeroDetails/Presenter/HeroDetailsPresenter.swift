//
//  HeroDetailsPresenter.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

class HeroDetailsPresenter: HeroDetailsPresenterProtocol {
    var view: HeroDetailsViewProtocol?
    var interactor: HeroDetailsUseCase!
    var heroId: Int!
    
    var hero: Hero!
    
    func viewDidLoad() {
        interactor.fetchHeroDetails(id: heroId)
    }
    
}

extension HeroDetailsPresenter: HeroDetailsInteractorOutput {
    func heroDetailsFetched(_ hero: Hero) {
        self.hero = hero
        self.view?.showHeroData(hero)
    }
    
    func heroDetailsFailed() {
        self.view?.showNoContentScreen()
    }
}
