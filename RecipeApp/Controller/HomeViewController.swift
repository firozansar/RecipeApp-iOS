//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//

import UIKit
import RecipeAPI

class HomeViewController: UIViewController {
    
    typealias Observer = (() -> Void)
    var onLoadSuccess: Observer?
    var onLoadFailure: Observer?
    /// When a recipe get select
    var select: ((Recipe) -> Void)?

    private var refreshControl = UIRefreshControl()
    private let recipeLoader: RemoteRecipeLoader
    private let searchComponent: SearchComponent
    private let recipeListViewController = RecipeListViewController()

    // MARK: - Init

    required init(recipeLoader: RemoteRecipeLoader) {
      self.recipeLoader = recipeLoader
      self.searchComponent = SearchComponent(recipeLoader: recipeLoader)
      super.init(nibName: nil, bundle: nil)
      self.title = "Recipes"
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError()
    }

    // MARK: - View life Cycle

    override func viewDidLoad() {
      super.viewDidLoad()

      setup()
      setupSearch()
      loadData()
    }

    // MARK: - Setup

    private func setup() {
      recipeListViewController.adapter.select = select
      add(childViewController: recipeListViewController)
      recipeListViewController.collectionView.addSubview(refreshControl)
      refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }

    private func setupSearch() {
      searchComponent.add(to: self)
      searchComponent.recipeListViewController.adapter.select = select
    }

    // MARK: - Action

    @objc private func refresh() {
      loadData()
    }

    // MARK: - Data

    private func loadData() {
      refreshControl.beginRefreshing()
        self.recipeLoader.load(completion: strongify(weak: self, closure: { strongSelf, result in
            switch result {
            case let .success(recipes):
                self.recipeListViewController.handle(recipes: recipes)
                self.refreshControl.endRefreshing()
                strongSelf.onLoadSuccess?()
            case .failure:
                self.refreshControl.endRefreshing()
                strongSelf.onLoadFailure?()
            }
        }))
    }

}
