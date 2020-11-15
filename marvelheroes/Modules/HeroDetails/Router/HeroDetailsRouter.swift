//
//  HeroDetailsRouter.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit

class HeroDetailsRouter: HeroDetailsRouterProtocol {
    
    static func assembleModule(_ heroId: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: HeroDetailsIdentifiersKeys.heroDetailsStoryboard.key, bundle: nil)
        let view = storyboard.instantiateViewController(identifier: HeroDetailsIdentifiersKeys.heroDetailsViewController.key) as? HeroDetailsViewController
        
        let presenter = HeroDetailsPresenter()
        let interactor = HeroDetailsInteractor()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.heroId = heroId
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        return view!
    }
    
}
