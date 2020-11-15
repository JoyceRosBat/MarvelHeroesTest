//
//  HeroesCollectionViewCell.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import UIKit
import Kingfisher

class HeroesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ hero: Hero) {
        self.layer.cornerRadius = self.frame.height * 0.02
        
        self.nameLabel.text = hero.name
        
        if let path = hero.thumbnail?.path , let thumbnailExtension = hero.thumbnail?.thumbnailExtension, let url = URL(string: path + "." + thumbnailExtension) {
            
            heroImageView.kf.setImage(with: url)
        }
    }

}
