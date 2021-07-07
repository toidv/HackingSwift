//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Steve Duong on 7/3/21.
//

import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController { get set}
    func start()
}
