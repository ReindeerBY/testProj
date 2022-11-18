//
//  UsersScreenControllerTests.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
@testable import TestProject

class UsersScreenControllerTests: XCTestCase {

    var controller: UsersScreenController!
    var viewModel: MockUsersScreenViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()

        viewModel = MockUsersScreenViewModel()
        controller = UsersScreenController()
    }

    func testViewDidLoad() {
        viewModel.usersViewModels = [UserCellViewModel(user: User(albumId: 1, userId: 1, name: "", url: "", thumbnailUrl: ""))]
        controller.viewModel = viewModel
        XCTAssertNoThrow(controller.viewDidLoad())
        XCTAssertNoThrow(controller.generateData())
        XCTAssertEqual(controller.dataSource.numberOfSections(in: controller.collectionView), 1)
        XCTAssertEqual(controller.dataSource.collectionView(controller.collectionView, numberOfItemsInSection: 0), 1)
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertNoThrow(controller.collectionView(controller.collectionView, didSelectItemAt: indexPath))
        wait(for: viewModel.didSelectItemAtExpectation)
    }
}
