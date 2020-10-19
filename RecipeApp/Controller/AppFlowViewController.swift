//
//  AppFlowViewController.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//

import UIKit


/// Manage app flow
final class AppFlowController: UIViewController {

  /// Start the flow
  func start() {
    let flowController = RecipeFlowController()
    add(childViewController: flowController)
    flowController.start()
  }
}
