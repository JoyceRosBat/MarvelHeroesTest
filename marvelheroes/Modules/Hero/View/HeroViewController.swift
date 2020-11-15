//
//  HeroViewController.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HeroViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var heroesCollectionView: UICollectionView!
    
    var activityIndicatorView:NVActivityIndicatorView?
    
    let HeroesCollectionViewCellIdentifier: String = HeroIdentifiersKeys.heroesCollectionViewCell.key
    
    let heroesCollectionViewFlowLayout: HeroesCollectionViewFlowLayout = HeroesCollectionViewFlowLayout()
    
    var presenter: HeroPresenterProtocol!
    var heroes: [Hero] = [] {
        didSet {
            heroesCollectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    func setupCollectionView() {
        heroesCollectionView.dataSource = self
        heroesCollectionView.delegate = self
        
        heroesCollectionView.showsHorizontalScrollIndicator = false
        heroesCollectionView.collectionViewLayout = heroesCollectionViewFlowLayout
        
        heroesCollectionView.register(UINib(nibName: HeroesCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: HeroesCollectionViewCellIdentifier)
    }
    
    func setupActivityIndicator() {
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.bounds.width * 0.5, y: self.view.bounds.height * 0.5, width: 50, height: 50), type: .ballRotateChase, color: UIColor.red, padding: 1)
        self.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
    }
    
}

extension HeroViewController: HeroesViewProtocol {
    func showNoContentScreen() {
        activityIndicatorView?.stopAnimating()
        errorLabel.isHidden = false
    }
    
    func showHeroesData(_ heroes: [Hero]) {
        activityIndicatorView?.stopAnimating()
        self.heroes = heroes
    }
    
}

extension HeroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCellIdentifier, for: indexPath) as? HeroesCollectionViewCell {
            let hero = heroes[indexPath.item]
            cell.setup(hero)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectHero(heroes[indexPath.item])
    }
    
}
