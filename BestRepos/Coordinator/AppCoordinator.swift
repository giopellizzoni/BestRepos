//
//  AppCoordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        
        
        navigationController.setColors()
        let flow = Flow(navigationController: navigationController)
        self.addChild(coordinator: flow)
        
        flow.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
