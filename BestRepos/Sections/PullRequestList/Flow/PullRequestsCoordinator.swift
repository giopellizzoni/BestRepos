//
//  PullRequestsCoordinator.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 02/01/20.
//  Copyright © 2020 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class PullRequestsCoordinator: BaseCoordinator {
    
    var repo: Repository!
    init(with repo: Repository) {
        self.repo = repo
    }
    
    override func start() {
        
        let service = WebService()
        let viewModel = PullRequestsViewModel(with: service, repo: repo)
        let viewController = PullRequestsListViewController(with: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
