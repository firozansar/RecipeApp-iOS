//
//  RecipeFlowController.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//

import UIKit
import RecipeAPI

/// Manage list and detail screens for recipe
final class RecipeFlowController: UINavigationController {
  /// Start the flow
  func start() {
    let recipeLoader = RemoteRecipeLoader(url: URL(safeString: Constant.endpoint), client: AFHTTPClient())
    let controller = HomeViewController(recipeLoader: recipeLoader)
    viewControllers = [controller]
    controller.select = { [weak self] recipe in
      self?.startDetail(recipe: recipe)
    }
  }

  private func startDetail(recipe: Recipe) {
    //let recipeLoader = RemoteRecipeLoader(url: URL(safeString: Constant.endpoint), client: AFHTTPClient())
    //let controller = RecipeDetailViewController(recipe: recipe, recipeLoader: recipeLoader)
    //pushViewController(controller, animated: true)
  }

  
}
