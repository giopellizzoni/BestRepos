//
//  RepositoryCellTableViewCell.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell, ReusableView {
    
    // MARK: - UI Properties
    lazy var authorPic: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var repoDataStackView: UIStackView  = {
        let stackView = UIStackView(arrangedSubviews: [authorName, repositoryName])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var repositoryDescription: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var repositoryStarsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var repositoryForkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension RepositoryCell {
    fileprivate func configureAuthorPicture() {
        addSubview(authorPic)
        NSLayoutConstraint.activate([
            authorPic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            authorPic.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            authorPic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupViews() {
        configureAuthorPicture()
        
        addSubview(repoDataStackView)
        NSLayoutConstraint.activate([
            repoDataStackView.leadingAnchor.constraint(equalTo: authorPic.trailingAnchor, constant: 8),
            repoDataStackView.topAnchor.constraint(equalTo: authorPic.topAnchor),
            repoDataStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        
    }
}


// MARK: - Configuration
extension RepositoryCell {
    func configure(repository: Repository) {
        guard let avatar = repository.owner?.avatar_url,
            let name = repository.full_name,
            let repoName = repository.name,
            let repoDesc = repository.description,
            let repoStars = repository.stargazers_count,
            let repoFork = repository.forks_count else { return }
        
        Task.detached {
            await self.authorPic.downloaded(from: avatar)
        }
        
        self.authorName.text = name
        self.repositoryName.text = repoName
        self.repositoryDescription.text = repoDesc
        self.repositoryStarsLabel.text = String(describing: repoStars)
        self.repositoryForkLabel.text = String(describing: repoFork)
        
    }
}
