//
//  SwiftRepositoriesViewModel.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 03/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


protocol SwiftRepositoriesViewModelProtocol {
    func fetchRepos()
}

class SwiftRepositoriesViewModel: SwiftRepositoriesViewModelProtocol {
    private var service: WebServiceProtocol
    
    init(with service: WebServiceProtocol) {
        self.service = service
    }
    
    
    func fetchRepos() {
        service.getRepositories { (repos, error) in
            
        }
    }
    
    
    
    
}
