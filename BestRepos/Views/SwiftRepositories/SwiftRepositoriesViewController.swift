//
//  SwiftRepositoriesViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class SwiftRepositoriesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SwiftRepositoriesViewModelProtocol!
    private var dataSource: TableViewDataSource<RepositoryCell, Repository>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeStatusBarColor()
        title = "Best Repos"
        viewModel.fetchRepos(onPage: 1) {
            self.setupTableView()
            self.tableView.reloadData()
        }
    }
    
    init(with viewModel: SwiftRepositoriesViewModelProtocol) {
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
        
        guard let repos = viewModel?.repositories else { return }
        self.dataSource = TableViewDataSource(cellIdentifier: "RepositoryCell",
                                              items: repos,
                                              configureCell: { (cell, it) in
                                                
                                                cell.configure(repository: it)
                                                
        })
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
    }
    
}

extension SwiftRepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let totalRepos = viewModel.totalRepositories else { return }
        let repos = viewModel.repositories
        
        if indexPath.row == repos.count - 1 {
            if repos.count < totalRepos {
                viewModel.page += 1
                viewModel.fetchRepos(onPage: viewModel.page) {
                    self.setupTableView()
                    self.tableView.reloadData()
                }
            }
        }
    }
}
