//
//  PostsScreenController.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import UIKit

protocol PostsScreenViewProtocol: AnyObject {

   func update()
}

class PostsScreenController: BaseCollectionController {

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>

    enum Section: Hashable {
        case userPosts
    }

    enum Item: Hashable {
        case userPosts(UserPostsCellViewModel)
    }

    private var dataSource: DataSource! = nil

    var viewModel: PostsScreenViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()
        viewModel.bind(self)
    }

    override func registerCells() {
        collectionView.register(cell: UserPostsCell.self)
        collectionView.register(header: UserPostsHeaderView.self)
    }

    override func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            return NSCollectionLayoutSection.postsSection
        }

        return layout
    }

    override func generateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.userPosts])
        let items = viewModel.userPostsViewModels.map(Item.userPosts)
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    override func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [unowned self] collectionView, indexPath, item in
            return self.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        })
        dataSource.supplementaryViewProvider = { [unowned self] collectionView, kind, indexPath in
            return self.supplementary(collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
    }

    private func supplementary(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return nil
        }
        let header: UserPostsHeaderView = collectionView.dequeueHeader(for: indexPath)
        header.configure(with: viewModel.userPostsHeaderViewModel)

        return header
    }

    // MARK: Cell
    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        switch item {
        case .userPosts(let viewModel):
            let cell: UserPostsCell = collectionView.dequeue(for: indexPath)
            cell.update(with: viewModel)

            return cell
        }
    }
}

extension PostsScreenController: PostsScreenViewProtocol {

    func update() {
        generateData()
    }
}
