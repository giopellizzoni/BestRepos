//
//  RepositoriesPresenter.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 03/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation


protocol RepositoriesPresenterProtocol: AnyObject {
    func fetchRepos() async
    
    func repoAtIndex(_ index: Int) -> Repository
    func increasePageNumber()
    func numberOfTotalRepos() -> Int
    func numberOfCurrentRepos() -> Int
}

class RepositoriesPresenter {
    
    private var repositories: [Repository] = []
    private var page: Int = 0
    private var totalRepositories: Int = 0
    
    private var repositoriesView: RepositoriesViewDelegate?
    private var service: WebServiceProtocol
    
    init(repositoriesView: RepositoriesViewDelegate? = nil, service: WebServiceProtocol) {
        self.repositoriesView = repositoriesView
        self.service = service
    }
}

extension RepositoriesPresenter: RepositoriesPresenterProtocol{
    
    func fetchRepos() async {
        guard let url = Url.repositories(language: "Swift", page: page) else { return }
        do {
            let data = try await service.load(from: url)
            let repoList = try JSONDecoder().decode(RepositoryList.self, from: data)
            self.totalRepositories = repoList.total_count ?? 0;
            
            guard let items = repoList.items else { return }
            self.repositories.append(contentsOf: items)
            repositoriesView?.reloadData()
        } catch {
            print(error)
        }
    }
    
    func numberOfTotalRepos() -> Int {
        return self.totalRepositories
    }
    
    func repoAtIndex(_ index: Int) -> Repository {
        return self.repositories[index]
    }
    
    func numberOfCurrentRepos() -> Int {
        return self.repositories.count
    }
    
    func increasePageNumber() {
        self.page += 1
    }
}
