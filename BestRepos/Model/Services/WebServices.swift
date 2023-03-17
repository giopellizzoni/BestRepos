//
//  WebServices.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

protocol WebServiceProtocol {
    func load(from url: URL) async throws -> Data
}

final class WebService: WebServiceProtocol {
    func load(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
