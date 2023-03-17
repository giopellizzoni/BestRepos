//
//  SwiftRepositoriesViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SwiftRepositoriesPresenterProtocol!
    private var dataSource: TableViewDataSource<RepositoryCell, Repository>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Best Repos"
        changeStatusBarColor()
        Task.detached {
            await self.viewModel.fetchRepos(onPage: 1)
        }
        setupTableView()
        
    }
    
    init(with viewModel: SwiftRepositoriesPresenterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100.0
        
        
        let nib = UINib(nibName: "RepositoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RepositoryCell")
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        self.dataSource = TableViewDataSource(cellIdentifier: "RepositoryCell",
                                              items: [],
                                              configureCell: { (cell, it) in
            
            cell.configure(repository: it)
            
        })
    }
}



extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let totalRepos = viewModel.totalRepositories else { return }
        let reposCount = viewModel.totalRepositories ?? 0
        
        if indexPath.row == reposCount - 1 {
            if reposCount < totalRepos {
                viewModel.page += 1
                Task.detached {
                    await self.viewModel.fetchRepos(onPage: self.viewModel.page)
                }
            }
        }
    }
}
