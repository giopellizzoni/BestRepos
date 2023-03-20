//
//  UIViewController+Extensions.swift
//  BestRepos
//
//  Created by giovanni.pellizzoni on 17/03/23.
//  Copyright © 2023 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private var statusBarHeight: CGFloat? {
        return UIApplication.shared.connectedScenes
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)?
            .rootViewController?
            .view
            .window?
            .windowScene?.statusBarManager?.statusBarFrame.size.height
    }
    
    func changeStatusBarColor() {
        if #available(iOS 13.0, *) {
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1)
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight ?? 0).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1)
        }
    }
    
}
