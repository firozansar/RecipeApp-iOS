//
//  UIImageView+Extensions.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 19/10/2020.
//

import UIKit

extension UIImageView {
    func setImage(remoteRecipeImageLoader: RemoteRecipeImageLoader, url: URL) {
    remoteRecipeImageLoader.loadImage(from: url, into: self)
  }
}

