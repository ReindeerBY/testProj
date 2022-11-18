//
//  UserPostsCellViewModel.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import Foundation

struct UserPostsCellViewModel: Hashable {

    let id: Int
    let title: String
    let body: String

    init(post: Post) {
        self.id = post.id
        self.title = post.title
        self.body = post.body
    }
}
