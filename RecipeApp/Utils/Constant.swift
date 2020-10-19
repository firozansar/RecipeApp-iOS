//
//  Constant.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import UIKit

public struct Constant {
    public static let endpoint = "http://mobile.asosservices.com/sampleapifortest/recipes.json"

    public static let placeholderImageName = "placeholder"

    struct Color {
        static var pink: UIColor { UIColor(red: 243/255, green: 177/255, blue: 191/255, alpha: 1.0) }
        static var yellow: UIColor { UIColor(red: 245/255, green: 212/255, blue: 156/255, alpha: 1.0) }
        static var blue: UIColor { UIColor(red: 142/255, green: 161/255, blue: 221/255, alpha: 1.0) }
    }

    struct Text {
        static let alertTitle = "Alert"
        static let alertMessage = "Something went wrong. Please try again."
        static let alertOKAction = "OK"
    }
}
