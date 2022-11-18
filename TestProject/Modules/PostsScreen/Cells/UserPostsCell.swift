//
//  UserPostsCell.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import Foundation
import UIKit

class UserPostsCell: UICollectionViewCell {

    private lazy var roundedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8.0
        view.layer.borderWidth = 1.0

        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with viewModel: UserPostsCellViewModel) {
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
    }

    private func setupView() {

        addSubview(roundedView)

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 0),
            topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 0)
        ])

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 16)
        ])

        addSubview(bodyLabel)

        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            bodyLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -16),
            bodyLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 16),
            bodyLabel.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -16),
        ])
    }
}
