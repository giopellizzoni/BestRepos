//
//  RepositoryCellTableViewCell.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var authorPic: UIImageView?
    @IBOutlet weak var authorName: UILabel?
    
    @IBOutlet weak var repositoryName: UILabel?
    @IBOutlet weak var repositoryDescription: UILabel?
    
    @IBOutlet weak var repositoryStars: UILabel?
    @IBOutlet weak var repositoryFork: UILabel?
    
    func configure(repository: Repository) {
        guard let avatar = repository.owner?.avatarUrl,
            let name = repository.fullName,
            let repoName = repository.name,
            let repoDesc = repository.description,
            let repoStars = repository.stargazersCount,
            let repoFork = repository.forksCount else { return }
        
        
        self.authorPic?.downloaded(from: avatar)
        self.authorName?.text = name
        self.repositoryName?.text = repoName
        self.repositoryDescription?.text = repoDesc
        self.repositoryStars?.text = String(describing: repoStars)
        self.repositoryFork?.text = String(describing: repoFork)
        
    }
    
}
