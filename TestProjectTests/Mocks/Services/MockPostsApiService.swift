//
//  MockPostsApiService.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
import Combine
@testable import TestProject

class MockPostsApiService: PostsApiServiceProtocol {

    let loadPostsExpectation = XCTestExpectation()

    func loadPosts() -> AnyPublisher<[Post], Error> {
        loadPostsExpectation.fulfill()
        let post1 = Post(id: 1, userId: 1, title: "Test1", body: "")
        let post2 = Post(id: 1, userId: 1, title: "Test2", body: "")

        return Just([post1, post2])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
