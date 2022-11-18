//
//  Mocks.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
@testable import TestProject

class MockUsersScreenController: UsersScreenViewProtocol {

    let updateExpectation = XCTestExpectation()

    func update() {
        updateExpectation.fulfill()
    }
}


class MockUsersScreenViewModel: UsersScreenViewModelProtocol {

    let bindViewExpectation = XCTestExpectation()
    let didSelectItemAtExpectation = XCTestExpectation()

    var usersViewModels: [UserCellViewModel] = []

    func bind(_ view: UsersScreenViewProtocol) {
        bindViewExpectation.fulfill()
    }

    func view(_ view: UsersScreenViewProtocol, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAtExpectation.fulfill()
    }
}

class MockUsersScreenRouter: UsersScreenRouterProtocol {

    let showUserPostsExpectation = XCTestExpectation()

    func showUserPosts(for user: User) {
        showUserPostsExpectation.fulfill()
    }
}
