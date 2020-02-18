//
//  BaseViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    
    func changeStatusBarColor() {
           if #available(iOS 13.0, *) {
               let app = UIApplication.shared
               let statusBarHeight: CGFloat = app.statusBarFrame.size.height
               
               let statusbarView = UIView()
               statusbarView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1)
               view.addSubview(statusbarView)
             
               statusbarView.translatesAutoresizingMaskIntoConstraints = false
               statusbarView.heightAnchor
                   .constraint(equalToConstant: statusBarHeight).isActive = true
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
