//
//  User.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation

struct User: Codable, Hashable {
    let albumId: Int
    let userId: Int
    let name: String
    let url: String
    let thumbnailUrl: String
    var posts: [Post]?

    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.userId == rhs.userId
    }
}
