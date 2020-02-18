//
//  PullRequestsListViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class PullRequestsListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: PullRequestsViewModelProtocol!
    private var dataSource: TableViewDataSource<PullRequestsTableViewCell, PullRequest>?
    
    init(with viewModel: PullRequestsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchPullRequests {
            self.setupTableView()
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight =  150.0
        
        let nib = UINib(nibName: "PullRequestsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PullRequestCell")
        
        
        self.dataSource = TableViewDataSource(cellIdentifier: "PullRequestCell", items: viewModel.pullRequests, configureCell: { (cell, pr) in
            cell.configure(with: pr)
        })
    }

}

extension PullRequestsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    
}
