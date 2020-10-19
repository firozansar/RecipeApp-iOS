//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//

import UIKit

class RecipeListViewController: UIViewController {
    private(set) var collectionView: UICollectionView!
    let adapter = Adapter<Recipe, RecipeCell>()
    private let emptyView = EmptyView(text: "No recipes found!")

    // MARK: - Life Cycle

    override func viewDidLoad() {
      super.viewDidLoad()

      setup()
    }

    private func setup() {
      view.backgroundColor = .white

      let layout = UICollectionViewFlowLayout()
      collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.dataSource = adapter
      collectionView.delegate = adapter
      collectionView.register(cellType: RecipeCell.self)
      collectionView.backgroundColor = Color.background
      collectionView.contentInset.top = 8
      collectionView.alwaysBounceVertical = true

      adapter.configure = { recipe, cell in
        cell.imageView.setImage(url: recipe.imageUrl, placeholder: R.image.recipePlaceholder())
        cell.label.text = recipe.title
      }

      view.addSubview(collectionView)
      NSLayoutConstraint.pin(view: collectionView, toEdgesOf: view)

      view.addSubview(emptyView)
      NSLayoutConstraint.pin(view: emptyView, toEdgesOf: view)
      emptyView.alpha = 0
    }

    func handle(recipes: [Recipe]) {
      adapter.items = recipes
      collectionView.reloadData()

      UIView.animate(withDuration: 0.25, animations: {
        self.emptyView.alpha = recipes.isEmpty ? 1 : 0
      })
    }
}
