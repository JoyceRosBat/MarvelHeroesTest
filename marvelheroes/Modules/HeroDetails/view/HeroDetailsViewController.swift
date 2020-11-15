//
//  HeroDetailsViewController.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HeroDetailsViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var activityIndicatorView:NVActivityIndicatorView?
    
    var presenter: HeroDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        setupActivityIndicator()
        presenter.viewDidLoad()
    }
    
    func setupActivityIndicator() {
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.bounds.width * 0.5, y: self.view.bounds.height * 0.5, width: 50, height: 50), type: .ballRotateChase, color: UIColor.red, padding: 1)
        self.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
    }
}

extension HeroDetailsViewController: HeroDetailsViewProtocol {
    
    func showNoContentScreen() {
        activityIndicatorView?.stopAnimating()
        errorLabel.isHidden = false
    }
    
    func showHeroData(_ hero: Hero) {
        activityIndicatorView?.stopAnimating()
        self.nameLabel.isHidden = false
        self.nameLabel.text = hero.name
        
        self.descriptionLabel.isHidden = false
        self.descriptionLabel.text = hero.description
        
        if let path = hero.thumbnail?.path , let thumbnailExtension = hero.thumbnail?.thumbnailExtension, let url = URL(string: path + "." + thumbnailExtension) {
            
            heroImageView.isHidden = false
            heroImageView.kf.setImage(with: url)
        }
        
        if let comics = hero.series?.item, comics.count > 0 {
            appendItemsInfo(withTitle: "Comics", items: comics)
        }
    
        if let series = hero.series?.item, series.count > 0 {
            appendItemsInfo(withTitle: "Series", items: series)
        }
        
        if let stories = hero.stories?.item, stories.count > 0 {
            appendItemsInfo(withTitle: "Stories", items: stories)
        }
        
        if let events = hero.events?.item, events.count > 0 {
            appendItemsInfo(withTitle: "Events", items: events)
        }
    }
    
}

extension HeroDetailsViewController {
    func appendItemsInfo(withTitle title: String, items: [Resources]) {
        createAndAddItem(withString: title, isHeader: true)
        
        items.forEach({ item in
            if let itemName = item.name {
                createAndAddItem(withString: itemName)
            }
        })
    }
    
    func createAndAddItem(withString string: String, isHeader: Bool = false) {
        let label = UILabel()
        label.numberOfLines = 0
        
        if isHeader {
            label.font = label.font.withSize(30)
            label.text = string
        } else {
            label.text = "・ " + string
        }
        
        contentStackView.addArrangedSubview(label)
    }
}
