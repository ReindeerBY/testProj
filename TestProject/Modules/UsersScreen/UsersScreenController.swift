//
//  UsersScreenController.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import UIKit

protocol UsersScreenViewProtocol: AnyObject {

   func update()
}

class UsersScreenController: BaseCollectionController {

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>

    enum Section: Hashable {
        case user
    }

    enum Item: Hashable {
        case user(UserCellViewModel)
    }

    var dataSource: DataSource! = nil

    var viewModel: UsersScreenViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        viewModel.bind(self)
    }

    override func registerCells() {
        collectionView.register(cell: UserCollectionCell.self)
    }

    override func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            return NSCollectionLayoutSection.usersSection
        }

        return layout
    }

    override func generateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.user])
        let items = viewModel.usersViewModels.map(Item.user)
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    override func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [unowned self] collectionView, indexPath, item in
            return self.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        })
    }

    // MARK: Cell
    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        switch item {
        case .user(let viewModel):
            let cell: UserCollectionCell = collectionView.dequeue(for: indexPath)
            cell.update(with: viewModel)

            return cell
        }
    }
}

extension UsersScreenController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.view(self, didSelectItemAt: indexPath)
    }
}

extension UsersScreenController: UsersScreenViewProtocol {

    func update() {
        generateData()
    }
}
