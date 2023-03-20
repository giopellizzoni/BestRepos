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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
