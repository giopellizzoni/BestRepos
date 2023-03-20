//
//  PullRequest.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct PullRequest : Decodable {
    
    let htmlURL, title: String?
    let user: User?
    let body: String?
    let createdAt: String?
}

