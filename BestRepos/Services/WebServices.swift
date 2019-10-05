//
//  WebServices.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

protocol WebServiceProtocol {
    func getRepositories(completionHandler: @escaping ([Repository]?, Error?) -> ())
}

class WebService: WebServiceProtocol {
    public let sharedInstance = WebService()
    
    func getRepositories(completionHandler: @escaping ([Repository]?, Error?) -> ()) {
        URLSession.shared.downloadReposFrom(URL(string: "")!, onSuccess: { (repos) in
            completionHandler(repos,nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
}
