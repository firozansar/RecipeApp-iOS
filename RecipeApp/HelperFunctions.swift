//
//  HelperFunctions.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import Foundation

func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}

