//
//  Post.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation

struct Post: Codable, Hashable {
    let id: Int
    var userId: Int
    let title: String
    let body: String

    static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
