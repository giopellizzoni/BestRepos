//
//  URLSession+Extension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension URLSession {
    
    func downloadImageFrom(url address: URL) async throws -> UIImage? {
        
        let (data, response) = try await URLSession.shared.data(from: address)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
              let mimeType = response.mimeType, mimeType.hasPrefix("image"),
              let image = UIImage(data: data) else { return nil}
        
        return image
    }
    
}
