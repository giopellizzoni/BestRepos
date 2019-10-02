//
//  PullRequestsListViewController.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 01/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class PullRequestsListViewController: UIViewController {
    
    var pullResquests = [PullRequest]()
    var owner: String?
    var repo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPullRequests()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = repo
    }
    
    
    // MARK: Auxiliary Methods
    
    func loadPullRequests(){
        let url = "https://api.github.com/repos/\(owner!)/\(repo!)/pulls"
        
//        Alamofire.request(url).responseJSON { (response) in
//            if let json = response.result.value as? [[String:Any]]{
//                let repos =  [PullRequest].from(jsonArray: json)!
//                self.pullResquests += repos
//            }
//            self.tableView.reloadData()
//        }
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

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
