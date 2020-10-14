//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import Foundation
import RecipeAPI

public class RecipeViewModel {
    typealias Observer = (() -> Void)
    private let recipeLoader: RecipeLoader

    var onLoadSuccess: Observer?
    var onLoadFailure: Observer?
    private(set) var recipeList = RecipeList()

    public init(recipeLoader: RecipeLoader) {
        self.recipeLoader = recipeLoader
    }

    func loadCakes() {
        recipeLoader.load(completion: strongify(weak: self, closure: { strongSelf, result in
            switch result {
            case let .success(recipeList):
                strongSelf.recipeList = recipeList
                strongSelf.onLoadSuccess?()
            case .failure:
                strongSelf.onLoadFailure?()
            }
        }))
    }
    
}
