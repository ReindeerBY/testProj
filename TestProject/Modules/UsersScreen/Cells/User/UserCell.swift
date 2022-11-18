//
//  UserCell.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import UIKit

class UserCollectionCell: UICollectionViewCell {

    private lazy var roundedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.borderWidth = 1.0

        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black

        return label
    }()

    private lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }

    func update(with viewModel: UserCellViewModel) {
        titleLabel.text = viewModel.name
        postsLabel.text = viewModel.postsCount
        let image = UIImage(systemName: "arrow.right.square")

        arrowImageView.image = image?.imageFlippedForRightToLeftLayoutDirection()
        imageView.imageFromURL(viewModel.avatar)
    }

    private func setupView() {

        addSubview(roundedView)

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 0),
            topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 0)
        ])

        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 64.0),
            imageView.widthAnchor.constraint(equalToConstant: 64.0),
            imageView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 16.0),
            imageView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
        ])

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 28),
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 16)
        ])

        addSubview(postsLabel)

        NSLayoutConstraint.activate([
            postsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            postsLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 16),
            postsLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])

        addSubview(arrowImageView)

        NSLayoutConstraint.activate([
            arrowImageView.heightAnchor.constraint(equalToConstant: 20.0),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20.0),
            arrowImageView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
        ])
    }
}
