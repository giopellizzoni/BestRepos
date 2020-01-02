//
//  Coordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func addChild(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func releaseChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
