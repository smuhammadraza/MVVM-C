//
//  Protocols.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import UIKit

protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> UIViewController
}
