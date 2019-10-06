//
//  Repository.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct RepositoryList: Decodable {
    let total_count: Int?
    let items: [Repository]?
}

struct Repository: Decodable {
    
    let name: String?
    let full_name: String?
    let owner: Owner?
    let description: String?
    let stargazers_count: Int?
    let forks_count: Int?
    
}
