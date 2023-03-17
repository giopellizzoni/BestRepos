//
//  SwiftRepositoriesPresenter.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 03/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


protocol SwiftRepositoriesPresenterProtocol {
    var repositories: [Repository] { get }
    var totalRepositories: Int? { get }
    var page: Int { get set }
    var errorMessage: String? { get }
    
    func fetchRepos(onPage page: Int) async
}

class SwiftRepositoriesPresenter: SwiftRepositoriesPresenterProtocol {
    var repositories: [Repository] = []
    var errorMessage: String?
    var page: Int = 1
    var totalRepositories: Int?
    
    
    private var service: WebServiceProtocol
    
    init(with service: WebServiceProtocol) {
        self.service = service
    }
    
    func fetchRepos(onPage page: Int) async {
        guard let url = Url.repositories(language: "Swift", page: 1) else { return }
        do {
            let data = try await service.load(from: url)
            let repoList = try JSONDecoder().decode(RepositoryList.self, from: data)
            self.totalRepositories = repoList.total_count ?? 0;
            guard let items = repoList.items else { return }
            self.repositories += items
            
        } catch {
            print(error)
        }
        
    }
    
}
