//
//  UsersScreenRouter.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import UIKit

protocol UsersScreenRouterProtocol {

    func showUserPosts(for user: User)
}

class UsersScreenRouter: UsersScreenRouterProtocol {

    weak var viewController: UIViewController?

    func showUserPosts(for user: User) {
        let controller = PostsScreenController()
        let viewModel = PostsScreenViewModel(user: user)
        controller.viewModel = viewModel

        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
