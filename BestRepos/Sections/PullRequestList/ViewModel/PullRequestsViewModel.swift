//
//  PullRequestsViewModel.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 02/01/20.
//  Copyright © 2020 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

protocol PullRequestsViewModelProtocol: class {
    var pullRequests: [PullRequest] { get set }
    var totalOfPrs: Int? { get }
    var repo: Repository { get }
    
    func fetchPullRequests(completion: @escaping () -> Void)
}

class PullRequestsViewModel: PullRequestsViewModelProtocol {
    var pullRequests: [PullRequest] = []
    var totalOfPrs: Int?
    var repo: Repository
    
    private var service: WebServiceProtocol
    
    init(with service: WebServiceProtocol, repo: Repository) {
        self.service = service
        self.repo = repo
    }
    
    func fetchPullRequests(completion: @escaping () -> Void) {
        guard let repoName = repo.name,
            let repoOwner = repo.owner?.login else { return }
        
        let url = "https://api.github.com/repos/\(repoOwner)/\(repoName)/pulls"
        
        let resource = Resource<[PullRequest]>(url: URL(string: url)!) { (data) -> [PullRequest]? in
            guard let pullRequests = try? JSONDecoder().decode([PullRequest].self, from: data) else {return nil}
            return pullRequests
        }
        
        self.service.load(resource: resource) { (pullRequests) in
            self.totalOfPrs = pullRequests?.count
            guard let prs = pullRequests else { return }
            self.pullRequests = prs
            completion()
        }
        
    }
    
}
