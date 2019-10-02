//
//  Repository.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    var name, fullName: String?
    var owner: Owner?
    var description: String?
    var stargazersCount, forksCount: Int?
    
}
