//
//  RecipeViewCell.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import UIKit
import RecipeAPI

class RecipeViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 6
      containerView.layer.masksToBounds = true
    }
    
    var recipe: Recipe? {
      didSet {
        if let recipe = recipe {
//            imageView.image = UIImage(recipe.imageURL)
            captionLabel.text = recipe.name
        }
      }
    }
    
}
