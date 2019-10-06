//
//  URLSession+Extension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension URLSession {
    
    func downloadImageFrom(url address: URL, completionHandler: @escaping (UIImage?) -> () ) {
        URLSession.shared.dataTask(with: address) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            completionHandler(image)
        }.resume()
    }
    
}
