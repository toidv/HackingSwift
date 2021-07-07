//
//  BuyCoordinator.swift
//  CoordinatorTest
//
//  Created by Steve Duong on 7/4/21.
//

import UIKit

class BuyCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
