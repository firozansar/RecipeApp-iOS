//
//  UICollectionViewController+Alert.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import UIKit

extension UICollectionViewController {
    func showBasicAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: Constant.Text.alertOKAction, style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
