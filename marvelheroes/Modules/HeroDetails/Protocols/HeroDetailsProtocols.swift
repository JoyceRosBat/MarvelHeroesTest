//
//  HeroDetailsProtocols.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

protocol HeroDetailsUseCase {
    var output:HeroDetailsInteractorOutput! { get set }
    
    func fetchHeroDetails(id: Int)
}

protocol HeroDetailsInteractorOutput {
    func heroDetailsFetched(_ hero: Hero)
    func heroDetailsFailed()
}

protocol HeroDetailsViewProtocol {
    var presenter: HeroDetailsPresenterProtocol! { get set }
    
    func showNoContentScreen()
    func showHeroData(_ hero: Hero)
}

protocol HeroDetailsPresenterProtocol {
    var view: HeroDetailsViewProtocol? { get set }
    var heroId: Int! { get set }
    var hero: Hero! { get set }
    
    func viewDidLoad()
}

protocol HeroDetailsRouterProtocol {
    static func assembleModule(_ heroId: Int) -> UIViewController
}
