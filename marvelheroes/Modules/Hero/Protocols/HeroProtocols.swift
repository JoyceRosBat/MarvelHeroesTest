//
//  HeroProtocols.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

protocol HeroUseCase {
    var output:HeroInteractorOutput! { get set }
    
    func fetchHeroes()
}

protocol HeroInteractorOutput {
    func heroesFetched(_ heroes: [Hero])
    func heroesFailed()
}

protocol HeroesViewProtocol {
    var presenter: HeroPresenterProtocol! { get set }
    
    func showNoContentScreen()
    func showHeroesData(_ heroes: [Hero])
}

protocol HeroPresenterProtocol {
    var view: HeroesViewProtocol? { get set }
    var interactor: HeroUseCase! { get set }
    var router: HeroRouterProtocol! { get set }
    
    func viewDidLoad()
    func didSelectHero(_ hero: Hero)
}

protocol HeroRouterProtocol {
    var viewController: UIViewController? { get set }
    func presentDetails(forHero hero: Hero)
    
    static func assembleModule() -> UIViewController
}
