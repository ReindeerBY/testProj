//
//  MockUsersApiService.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
import Combine
@testable import TestProject

class MockUsersApiService: UsersApiServiceProtocol {

    let loadUsersExpectation = XCTestExpectation()

    func loadUsers() -> AnyPublisher<[User], Error> {
        loadUsersExpectation.fulfill()
        let user = User(albumId: 1, userId: 1, name: "", url: "", thumbnailUrl: "")

        return Just([user])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
