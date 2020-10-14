//
//  RecipeUIComposer.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import UIKit
import RecipeAPI

public final class RecipeUIComposer {
    private init() {}

    static func composeRecipeCollectionViewControllerWith(loaderURL url: URL) -> RecipeCollectionViewController {
        let client = AFHTTPClient()
        let recipeLoader = RemoteRecipeLoader(url: url, client: client)
        let imageLoader = RemoteRecipeImageLoader()
        return listComposedWith(recipeLoader: recipeLoader, imageLoader: imageLoader)
    }

    static func listComposedWith(recipeLoader: RecipeLoader, imageLoader: RecipeImageLoader) -> RecipeCollectionViewController {
        let recipeViewModel = RecipeViewModel(recipeLoader: recipeLoader)
        let recipeListViewController = RecipeCollectionViewController(viewModel: recipeViewModel, imageLoader: imageLoader)
        return recipeListViewController
    }
}
