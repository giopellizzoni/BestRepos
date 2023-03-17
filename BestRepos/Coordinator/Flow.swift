//
//  Flow.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class Flow: BaseCoordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let service = WebService()
        let view = RepositoriesView()
        let presenter = RepositoriesPresenter(repositoriesView: view, service: service)
        let viewController = RepositoriesViewController(view: view, presenter: presenter)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
