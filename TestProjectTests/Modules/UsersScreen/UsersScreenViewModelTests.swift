//
//  UsersScreenViewModelTests.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
@testable import TestProject

class UsersScreenViewModelTests: XCTestCase {

    var viewModel: UsersScreenViewModel!
    var usersApiService: MockUsersApiService!
    var postsApiService: MockPostsApiService!
    var router: MockUsersScreenRouter!
    var controller: MockUsersScreenController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        controller = MockUsersScreenController()
        usersApiService = MockUsersApiService()
        postsApiService = MockPostsApiService()
        router = MockUsersScreenRouter()
        viewModel = UsersScreenViewModel(router: router,
                                         usersApiService: usersApiService,
                                         postsApiService: postsApiService)
    }

    func testBindView() {
        XCTAssertNoThrow(viewModel.bind(controller))
        XCTAssertEqual(viewModel.users.first?.posts?.count ?? 0, 1)
        wait(for: usersApiService.loadUsersExpectation)
        wait(for: postsApiService.loadPostsExpectation)
        wait(for: controller.updateExpectation)
    }

    func testDidSelectItem() {
        XCTAssertNoThrow(viewModel.bind(controller))
        let indexPath = IndexPath(row: 0, section: 0)
        viewModel.view(controller, didSelectItemAt: indexPath)
        wait(for: router.showUserPostsExpectation)
    }
}
