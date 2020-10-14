//
//  RecipeImageLoader.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import UIKit

public protocol RecipeImageLoader {
    func loadImage(from url: URL, into view: UIImageView)
}

