//
//  EmptyView.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 19/10/2020.
//

import UIKit

/// Used to show when there's no data
final class EmptyView: UIView {
  private lazy var imageView: UIImageView = self.makeImageView()
  private lazy var label: UILabel = self.makeLabel()

  required init(text: String) {
    super.init(frame: .zero)

    isUserInteractionEnabled = false
    addSubviews([imageView, label])
    label.text = text
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
      imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),

      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
    ])
  }

  // MARK: - Make

  private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(named:"notFound")
    return imageView
  }

  private func makeLabel() -> UILabel {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }
}
