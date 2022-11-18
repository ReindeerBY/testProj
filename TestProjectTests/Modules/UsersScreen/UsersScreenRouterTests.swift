//
//  UsersScreenRouterTests.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest
@testable import TestProject

class UsersScreenRouterTests: XCTestCase {

    var router: UsersScreenRouter!
    var viewController: UIViewController!
    var navigationController: UINavigationController!
    var window: UIWindow!

    override func setUpWithError() throws {
        try super.setUpWithError()

        viewController = UIViewController()
        navigationController =  UINavigationController(rootViewController: viewController)
        router = UsersScreenRouter()
        router.viewController = viewController

        window = UIWindow()
        window.makeKeyAndVisible()
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.addSubview(navigationController.view)
        navigationController.view.layoutIfNeeded()
    }

    func testShowUserPosts() {
        let user = User(albumId: 1, userId: 1, name: "", url: "", thumbnailUrl: "")
        router.showUserPosts(for: user)
        XCTAssertTrue(viewController.navigationController?.topViewController is PostsScreenController)
    }
}
