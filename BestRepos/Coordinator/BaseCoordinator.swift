//
//  BaseCoordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 02/01/20.
//  Copyright © 2020 Giovanni Pellizzoni. All rights reserved.
//

import UIKit


protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController = UINavigationController()
    var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("Start method must be implemented")
    }
    
    func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: {$0 === coordinator}) {
            self.childCoordinators.remove(at: index)
        }
    }
    
    
}
