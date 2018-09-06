//
//  RepositoryCellTableViewCell.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class RepositoryCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var authorPic: UIImageView?
    @IBOutlet weak var authorName: UILabel?
    
    @IBOutlet weak var repositoryName: UILabel?
    @IBOutlet weak var repositoryDescription: UILabel?
    
    @IBOutlet weak var repositoryStars: UILabel?
    @IBOutlet weak var repositoryFork: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
