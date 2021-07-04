//
//  Storyboarded.swift
//  CoordinatorTest
//
//  Created by Steve Duong on 7/3/21.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        // Load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        print("id: \(className)")
        // instantiate a view controller with that identifier as force cast as type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
        
    }
}
