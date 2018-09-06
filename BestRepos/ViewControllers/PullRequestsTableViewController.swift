//
//  PullRequestsTableViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class PullRequestsTableViewController: UITableViewController {
    
    var pullResquests = [PullRequest]()
    var owner: String?
    var repo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PullRequestsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "pullRequestCell")
        tableView.separatorStyle = .none
        loadPullRequests()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = repo
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string:  pullResquests[indexPath.row].htmlURL!)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullResquests.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullRequestCell") as! PullRequestsTableViewCell
        
        let pullRequest = pullResquests[indexPath.row] 
        
        cell.authorPRPic?.downloaded(from: URL(string: (pullRequest.user?.avatarURL!)!)!)
        cell.authorPRname.text = pullRequest.user?.login
        cell.bodyPR.text = pullRequest.body
        cell.datePR.text = formatDate(date: pullRequest.createdAt!)
        cell.titlePR.text = pullRequest.title
        
        return cell
    }
    
    
    
    
    // MARK: Auxiliary Methods
    
    func loadPullRequests(){
        let url = "https://api.github.com/repos/\(owner!)/\(repo!)/pulls"
        
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value as? [[String:Any]]{
                let repos =  [PullRequest].from(jsonArray: json)!
                self.pullResquests += repos
            }
            self.tableView.reloadData()
        }
    }
    
    
    func formatDate(date dateStr: String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatterGet.date(from: dateStr){
            return dateFormatterPrint.string(from: date)
        }
        else {
            return ("NO DATE")
        }
    }
}
