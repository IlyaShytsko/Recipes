//
//  Storyboarded.swift
//  CodeChallengeShytsko
//
//  Created by Ilya Shytsko on 14.12.23.
//

import UIKit

protocol Storyboarded {}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

enum Storyboard: String {
    case main
 
    var name: String {
        rawValue.capitalizingFirstLetter()
    }
}
