
//
//  SwiftRepositoriesListCoordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 02/01/20.
//  Copyright © 2020 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

class SwiftRepositoriesListCoordinator : BaseCoordinator {
    
    private var prCoordinators: PullRequestsCoordinator?
    private var viewController: SwiftRepositoriesViewController?
    
    override func start() {
        let service = WebService()
        let viewModel = SwiftRepositoriesViewModel(with: service)
        viewModel.delegate = self
        viewController = SwiftRepositoriesViewController(with: viewModel)

        self.navigationController.pushViewController(viewController!, animated: true)
        
    }
    
}

extension SwiftRepositoriesListCoordinator: SwiftDidSelectRepositoryDelegate {
    func didSelectRepository(_ repo: Repository) {
        let prCoordinators = PullRequestsCoordinator(with: repo)
        prCoordinators.navigationController = self.navigationController
        start(coordinator: prCoordinators)
    }
    
}
