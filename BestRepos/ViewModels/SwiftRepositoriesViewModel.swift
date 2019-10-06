//
//  SwiftRepositoriesViewModel.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 03/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


protocol SwiftRepositoriesViewModelProtocol {
    var repositories: [Repository] { get }
    var totalRepositories: Int? { get }
    var page: Int { get set }
    
    func fetchRepos(onPage page: Int, completion: @escaping () -> ())
}

class SwiftRepositoriesViewModel: SwiftRepositoriesViewModelProtocol {
    
    var page: Int = 1
    var totalRepositories: Int?
    var repositories: [Repository] = [Repository]()
    
    private var service: WebServiceProtocol
    
    init(with service: WebServiceProtocol) {
        self.service = service
    }
    
    
    func fetchRepos(onPage page: Int, completion: @escaping () -> ()) {
        let url = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(page)"
        
        let resource = Resource<RepositoryList>(url: URL(string: url)!) { (data) in
            guard let repos = try? JSONDecoder().decode(RepositoryList.self, from: data) else { return nil }
            
            return repos
        }
        
        self.service.load(resource: resource) { (repos) in
            self.totalRepositories = repos?.total_count ?? 0
            guard let items = repos?.items else { return }
            self.repositories += items
            
            completion()
        }
        
    }
    
}
