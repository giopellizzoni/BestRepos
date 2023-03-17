//
//  Constants.swift
//  BestRepos
//
//  Created by giovanni.pellizzoni on 17/03/23.
//  Copyright © 2023 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

public struct Url {
    private static var baseURL: String {
        return "https://api.github.com/search"
    }
    
    public static func repositories(language: String = "Swift", page: Int = 0) -> URL? {
        let fullUrl = baseURL + "/repositories" + "?q=language:\(language)&sort=stars&page=\(page)"
        
        guard let url = URL(string: fullUrl) else { return nil }
        return url
    }
}
