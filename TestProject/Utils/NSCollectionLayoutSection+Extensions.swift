//
//  NSCollectionLayoutSection.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import UIKit

extension NSCollectionLayoutSection {

    static let usersSection: NSCollectionLayoutSection = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitems: [item])
        let contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        group.contentInsets = contentInsets

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0

        return section
    }()

    static let postsSection: NSCollectionLayoutSection = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitems: [item])
        group.contentInsets = contentInsets
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0

        let headerContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        addBigImageHeader(toSection: section, contentInsets: headerContentInsets)

        return section
    }()

    private static func addBigImageHeader(toSection section: NSCollectionLayoutSection, contentInsets: NSDirectionalEdgeInsets = .empty) {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(140))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.contentInsets = contentInsets
        headerElement.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [headerElement]
    }
}

extension NSDirectionalEdgeInsets {

    static let empty = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
}
