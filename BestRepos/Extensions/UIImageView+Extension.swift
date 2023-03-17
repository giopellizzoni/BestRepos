//
//  ImageViewExtension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) async throws {
        contentMode = mode
        self.image = try await URLSession.shared.downloadImageFrom(url: url)
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) async {
        guard let url = URL(string: link) else { return }
        do {
            try await downloaded(from: url, contentMode: mode)
        } catch{
            print(" image not found")
        }
    }
}
