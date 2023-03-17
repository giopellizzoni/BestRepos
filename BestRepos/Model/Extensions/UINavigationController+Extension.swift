//
//  UINavigationController+Extension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setColors(bgColor color: UIColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1), titleColor textColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) {
        self.navigationBar.barTintColor = color
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        
        self.navigationBar.backgroundColor = color
        self.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : textColor]
        
    }
}
