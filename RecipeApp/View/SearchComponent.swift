//
//  SearchComponent.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 18/10/2020.
//
import UIKit
import RecipeAPI

/// A reusable component to add search functionality via search bar
final class SearchComponent: NSObject, UISearchResultsUpdating, UISearchBarDelegate {
  let recipeLoader: RecipeLoader
  let searchController: UISearchController
  let recipeListViewController = RecipeListViewController()
  var task: URLSessionTask?
  private lazy var loadingIndicator: UIActivityIndicatorView = self.makeLoadingIndicator()

  /// Avoid making lots of requests when user types fast
  /// This throttles the search requests
  let debouncer = Debouncer(delay: 2)

  required init(recipeLoader: RecipeLoader) {
    self.recipeLoader = recipeLoader
    self.searchController = UISearchController(searchResultsController: recipeListViewController)
    super.init()
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.searchBar.placeholder = "Search recipe"

    recipeListViewController.view.addSubview(loadingIndicator)
    NSLayoutConstraint.activate([
      loadingIndicator.centerXAnchor.constraint(equalTo: recipeListViewController.view.centerXAnchor),
      loadingIndicator.centerYAnchor.constraint(equalTo: recipeListViewController.view.centerYAnchor, constant: -100)
    ])
  }

  /// Add search bar to view controller
  func add(to viewController: UIViewController) {
    if #available(iOS 11, *) {
      viewController.navigationItem.searchController = searchController
      viewController.navigationItem.hidesSearchBarWhenScrolling = false
    } else {
      viewController.navigationItem.titleView = searchController.searchBar
    }

    viewController.definesPresentationContext = true
  }

  // MARK: - UISearchResultsUpdating

  func updateSearchResults(for searchController: UISearchController) {
    // No op
  }

  // MARK: - UISearchBarDelegate

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    debouncer.schedule { [weak self] in
      self?.performSearch()
    }
  }

  // MARK: - Logic

  private func performSearch() {
    guard let text = searchController.searchBar.text, !text.isEmpty else {
      return
    }

    search(query: text)
  }

  private func search(query: String) {
    task?.cancel()
    loadingIndicator.startAnimating()
    task = recipeLoader.search(query: query, completion: { [weak self] recipes in
      self?.loadingIndicator.stopAnimating()
      self?.recipeListViewController.handle(recipes: recipes)
    })
  }

  // MARK: - Make

  private func makeLoadingIndicator() -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    view.color = .darkGray
    view.hidesWhenStopped = true
    return view
  }
}
