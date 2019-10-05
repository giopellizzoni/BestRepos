//
//  SwiftRepositoriesViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class SwiftRepositoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repositories = [Repository]()
    var totalRepositories = 0
    var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBackgroundColor()
        
        let nib = UINib(nibName: "RepositoryCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
        tableView.separatorStyle = .none
        loadRepos(page)
    }
    
    
    // MARK: Auxiliary Methods
    func loadRepos(_ onPage: Int){
        let url = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(onPage)"
        
    }
    
}
