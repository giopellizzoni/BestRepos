//
//  RepositoryViewModel.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


struct RepositoryListViewModel {
    let repositories: [Repository]
    
    init(with repositories: [Repository]) {
        self.repositories = repositories
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return repositories.count
    }
    
    func modelAt(_ index: Int) -> Repository {
        return repositories[index]
    }
}
