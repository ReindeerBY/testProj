//
//  UserCellViewModel.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation

struct UserCellViewModel: Hashable {

    let id: Int
    let name: String
    let postsCount: String
    let avatar: String

    init(user: User) {
        self.id = user.userId
        self.name = user.name
        self.avatar = user.thumbnailUrl
        self.postsCount = "\("Posts count".localized) \(user.posts?.count ?? 0)"
    }
}
