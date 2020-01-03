//
//  Repository.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct RepositoryList: Codable {
    let totalCount: Int?
    let items: [Repository]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct Repository: Codable {
    
    let name: String?
    let fullName: String?
    let owner: Owner?
    let description: String?
    let stargazersCount: Int?
    let forksCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }
    
}
