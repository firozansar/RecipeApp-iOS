//
//  SceneDelegate.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 13/10/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let endpointURL = URL(safeString: Constant.endpoint)
        let recipeCollectionViewController = RecipeUIComposer.composeRecipeCollectionViewControllerWith(loaderURL: endpointURL)

        window?.rootViewController = recipeCollectionViewController
        window?.makeKeyAndVisible()
    }

}

