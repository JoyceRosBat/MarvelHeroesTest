//
//  HeroRouter.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

class HeroRouter: HeroRouterProtocol {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: HeroIdentifiersKeys.heroStoryboard.key, bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: HeroIdentifiersKeys.heroViewController.key) as? HeroViewController
        let presenter = HeroPresenter()
        let interactor = HeroInteractor()
        let router = HeroRouter()
        
        let navigationController = UINavigationController(rootViewController: view!)
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigationController
    }
    
    func presentDetails(forHero hero: Hero) {
        if let heroId = hero.id {
            let heroDetailsViewController = HeroDetailsRouter.assembleModule(heroId)
            viewController?.navigationController?.pushViewController(heroDetailsViewController, animated: true)
        }
    }
    
}
