//
//  Repository.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation
import Gloss


struct Repository: JSONDecodable {
    
    var name, fullName: String?
    var owner: Owner?
    var description: String?
    var stargazersCount, forksCount: Int?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.fullName = "full_name" <~~ json
        self.owner = "owner" <~~ json
        self.description = "description" <~~ json
        self.stargazersCount = "stargazers_count" <~~ json
        self.forksCount = "forks_count" <~~ json
        
    }

}

struct Owner: JSONDecodable {
    init?(json: JSON) {
        self.avatarURL = "avatar_url" <~~ json
        self.login = "login" <~~ json
    }
    var avatarURL: String?
    var login: String?
}

