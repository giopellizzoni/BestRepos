//
//  ImageViewExtension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.downloadImageFrom(url: url) { (image) in
            DispatchQueue.main.async {
             self.image = image
            }
        }
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
