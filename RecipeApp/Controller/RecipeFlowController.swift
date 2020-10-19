//
//  RecipeFlowController.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//

import UIKit

/// Manage list and detail screens for recipe
final class RecipeFlowController: UINavigationController {
  /// Start the flow
  func start() {
    let service = RecipesService(networking: NetworkService())
    let controller = HomeViewController(recipesService: service)
    viewControllers = [controller]
    controller.select = { [weak self] recipe in
      self?.startDetail(recipe: recipe)
    }
  }

  private func startDetail(recipe: Recipe) {
    let service = RecipesService(networking: NetworkService())
    let controller = RecipeDetailViewController(recipe: recipe, recipesService: service)

    pushViewController(controller, animated: true)
  }

  
}
