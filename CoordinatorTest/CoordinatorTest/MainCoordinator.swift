//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Steve Duong on 7/3/21.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }
    
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
        child.parentCoordinator = self
//        let vc = BuyViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: false)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    init(navigatorController: UINavigationController) {
        self.navigationController = navigatorController
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the controller we are moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from)  else {
            return
        }
        
        // Check whether our view controller array already contains that view controller. If it does it means we are pushing different view controller on top rather than poping it, so exit
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // We're still here - it means we're poping the view controller, so we can check whether it's a buy view controller
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}
