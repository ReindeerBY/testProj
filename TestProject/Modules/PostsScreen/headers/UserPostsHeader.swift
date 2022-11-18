//
//  UserPostsHeader.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import UIKit

class UserPostsHeaderView: UICollectionReusableView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    func configure(with viewModel: UserPostsHeaderViewModel) {
        imageView.imageFromURL(viewModel.imageString)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        addSubview(imageView)

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
            topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0)
        ])
    }
}
