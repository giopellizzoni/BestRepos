//
//  PullRequestsTableViewCell.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 06/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class PullRequestsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorPRPic: UIImageView!
    @IBOutlet weak var authorPRname: UILabel!
    @IBOutlet weak var titlePR: UILabel!
    @IBOutlet weak var datePR: UILabel!
    @IBOutlet weak var bodyPR: UILabel!
    
    func configure(with pr: PullRequest) {
        guard let authorPic = pr.user?.avatarUrl,
            let name = pr.user?.login,
            let title = pr.title,
            let date = pr.createdAt,
            let body = pr.body
            else { return }
        
        self.authorPRPic.downloaded(from: authorPic)
        self.authorPRname.text = name
        self.titlePR.text = title
        self.datePR.text = date.formatDate()
        self.bodyPR.text = body
    }
    
}
