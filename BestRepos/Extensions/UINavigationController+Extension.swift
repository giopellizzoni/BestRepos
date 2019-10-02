//
//  UINavigationController+Extension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setNavigationBackgroundColor(_ color: UIColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1)) {
        self.navigationBar.barTintColor = color
    }
}
