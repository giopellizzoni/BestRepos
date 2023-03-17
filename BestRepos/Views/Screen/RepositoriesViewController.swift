//
//  SwiftRepositoriesViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    private var repositoriesView: RepositoriesView
    private var presenter: RepositoriesPresenterProtocol
    
    init(view: RepositoriesView, presenter: RepositoriesPresenterProtocol) {
        self.repositoriesView = view
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        repositoriesView.delegate = self
        repositoriesView.presenter = presenter
        repositoriesView.setupViews()
        self.view = repositoriesView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        
    }
    
}

extension RepositoriesViewController: RepositoriesViewControllerDelegate {
    
}
