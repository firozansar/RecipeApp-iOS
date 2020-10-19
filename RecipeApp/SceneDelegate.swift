//
//  SceneDelegate.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 13/10/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appFlowController = AppFlowController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        window?.rootViewController = appFlowController
        window?.makeKeyAndVisible()

        appFlowController.start()

    }

}

