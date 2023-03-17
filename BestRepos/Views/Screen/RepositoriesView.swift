//
//  RepositoriesView.swift
//  BestRepos
//
//  Created by giovanni.pellizzoni on 17/03/23.
//  Copyright © 2023 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

protocol RepositoriesViewControllerDelegate: AnyObject {
    
}

protocol RepositoriesViewDelegate: AnyObject {
    func reloadData()
}

class RepositoriesView: UIView {
    
    private(set) var pageTitle = "Best Repos"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(RepositoryCell.self,
                           forCellReuseIdentifier: RepositoryCell.defaultReuseIdentifier)
        return tableView
    }()
    
    var presenter: RepositoriesPresenterProtocol!
    weak var delegate: RepositoriesViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RepositoriesView {
    func setupViews() {
        Task.detached {
            await self.presenter.fetchRepos()
        }
    }
    
    private func configureViews() {
        backgroundColor = .white
        configureTableView()
    }
    
    private func configureTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension RepositoriesView: RepositoriesViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension RepositoriesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension RepositoriesView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCurrentRepos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.defaultReuseIdentifier,
                                                       for: indexPath) as? RepositoryCell else {
            return UITableViewCell()
        }
        
        cell.configure(repository: presenter.repoAtIndex(indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let totalRepos = presenter.numberOfTotalRepos()
        let reposCount = presenter.numberOfCurrentRepos()
        
        if indexPath.row == reposCount - 1 {
            if reposCount < totalRepos {
                presenter.increasePageNumber()
                Task.detached {
                    await self.presenter.fetchRepos
                }
            }
        }
    }
}
