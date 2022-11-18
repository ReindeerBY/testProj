//
//  BaseCollectionController.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import UIKit

class BaseCollectionController: UIViewController {

    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        registerCells()
        configureDataSource()
    }

    open func setupUI() {
        view.backgroundColor = UIColor.backgroundColor

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    open func generateData() {}

    open func configureDataSource() {}

    open func registerCells() {}

    open func createLayout() -> UICollectionViewLayout {
        return UICollectionViewLayout()
    }
}
