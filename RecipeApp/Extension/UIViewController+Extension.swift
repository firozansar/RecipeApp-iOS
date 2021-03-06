//
//  UIViewController+Extension.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 19/10/2020.
//

import UIKit

extension UIViewController {
  /// Add child view controller and its view
  func add(childViewController: UIViewController) {
    addChild(childViewController)
    view.addSubview(childViewController.view)
    childViewController.didMove(toParent: self)
  }
}
