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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    lazy var repositoryDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var repoDataStackView: UIStackView  = {
        let stackView = UIStackView(arrangedSubviews: [repositoryName, authorName, repositoryDescription])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var starsView: NumbersView = {
        let view = NumbersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var forksView: NumbersView = {
        let view = NumbersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var numbersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            starsView, forksView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
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
            authorPic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            authorPic.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            authorPic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            authorPic.widthAnchor.constraint(equalToConstant: 80),
            authorPic.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    fileprivate func configureStackview() {
        addSubview(repoDataStackView)
        NSLayoutConstraint.activate([
            repoDataStackView.leadingAnchor.constraint(equalTo: authorPic.trailingAnchor, constant: 8),
            repoDataStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            repoDataStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)
        ])
    }
    
    private func setupViews() {
        configureAuthorPicture()
        configureStackview()
        
        addSubview(numbersStackView)
        NSLayoutConstraint.activate([
            numbersStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            numbersStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            numbersStackView.leadingAnchor.constraint(equalTo: self.repoDataStackView.trailingAnchor, constant: 10),
            numbersStackView.widthAnchor.constraint(equalToConstant: 80)
            
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
        self.forksView.setupViews(imageName: UIImageName.fork, text: "\(repoFork)")
        self.starsView.setupViews(imageName: UIImageName.stars, text: "\(repoStars)")
        
    }
}
