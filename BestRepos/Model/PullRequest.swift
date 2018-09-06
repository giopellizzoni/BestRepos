//
//  PullRequest.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation
import Gloss

struct PullRequest : JSONDecodable {
    
    let htmlURL, title: String?
    let user: User?
    let body: String?
    let createdAt: String?
    
    init?(json: JSON) {
        self.htmlURL = "html_url" <~~ json
        self.title = "title" <~~ json
        self.user = "user" <~~ json
        self.body = "body" <~~ json
        self.createdAt = "created_at" <~~ json
    }
}

struct User : JSONDecodable {
    
    let login, avatarURL: String?
    
    init?(json: JSON) {
        self.login = "login" <~~ json
        self.avatarURL = "avatar_url" <~~ json
    }
}

