//
//  ViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit
import Alamofire
import Gloss



class SwiftRepositoryTableViewController: UITableViewController {
    
    var repositories = [Repository]()
    var numberOfRowsLimit = 0
    var totalRepositories = 0
    var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "RepositoryCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
        tableView.separatorStyle = .none
        loadRepos()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! RepositoryCellTableViewCell
        
        let repository = repositories[indexPath.row]
        
        cell.authorPic?.downloaded(from: URL(string: (repository.owner?.avatarURL!)!)!)
        cell.authorName!.text = repository.name
        cell.repositoryDescription!.text = repository.description
        cell.repositoryFork!.text = String(repository.forksCount!)
        cell.repositoryName!.text = repository.fullName
        cell.repositoryStars!.text = String(repository.stargazersCount!)
        
        
        return cell
    }
    
    
    func loadRepos(){
        let url = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(page)"
        
        Alamofire.request(url)
            .responseJSON { (response) in
                if let json = response.result.value as? [String:Any]{
                    if let reposArray = json["items"] as? [[String:Any]] {
                        self.repositories = [Repository].from(jsonArray: reposArray)!
                    }
                }
                self.tableView.reloadData()
        }
    }
    
}

