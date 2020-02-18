//
//  PullRequest.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct PullRequest: Codable {
    
    let htmlURL: String?
    let title: String?
    let user: User?
    let body: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case title
        case user
        case body
        case createdAt = "created_at"
    }
}

