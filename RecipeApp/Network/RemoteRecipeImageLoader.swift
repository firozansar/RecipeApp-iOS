//
//  RemoteRecipeImageLoader.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import SDWebImage
import UIKit

public class RemoteRecipeImageLoader : RecipeImageLoader {
    private var placeholderImage: UIImage? {
        UIImage(named: Constant.placeholderImageName)
    }

    public init() {}

    public func loadImage(from url: URL, into view: UIImageView) {
        view.sd_setImage(with: url, placeholderImage: placeholderImage, options: .highPriority)
    }
}
