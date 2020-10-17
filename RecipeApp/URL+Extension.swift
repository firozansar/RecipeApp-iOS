//
//  URL+Extension.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import Foundation

extension URL {
    /// Non-optional initializer with better fail output
    public init(safeString string: String) {
        guard let instance = URL(string: string) else {
            fatalError("Unconstructable URL: \(string)")
        }
        self = instance
    }
}
