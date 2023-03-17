//
//  RepoNumbersView.swift
//  BestRepos
//
//  Created by giovanni.pellizzoni on 17/03/23.
//  Copyright © 2023 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

class NumbersView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    
    private lazy var numbersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView, numbersLabel
        ])
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NumbersView {
    private func configureViews() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setupViews(imageName: String, text: String) {
        imageView.image = UIImage(named: imageName)
        numbersLabel.text = text
        
    }
}
