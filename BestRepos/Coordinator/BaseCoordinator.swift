//
//  BaseCoordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?
    
    func start() {
        
    }
    
    
}
