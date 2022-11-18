//
//  UsersViewModel.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import Combine

protocol UsersScreenViewModelProtocol {

    func bind(_ view: UsersScreenViewProtocol)
    func view(_ view: UsersScreenViewProtocol, didSelectItemAt indexPath: IndexPath)

    var usersViewModels: [UserCellViewModel] { get }
}

class UsersScreenViewModel: UsersScreenViewModelProtocol {
    private let router: UsersScreenRouterProtocol
    private let usersApiService: UsersApiServiceProtocol
    private let postsApiService: PostsApiServiceProtocol
    private var subscriptions: Set<AnyCancellable>

    private weak var view: UsersScreenViewProtocol!

    var usersViewModels: [UserCellViewModel]
    var users: [User]

    init(router: UsersScreenRouterProtocol,
         usersApiService: UsersApiServiceProtocol,
         postsApiService: PostsApiServiceProtocol) {

        self.router = router
        self.usersApiService = usersApiService
        self.postsApiService = postsApiService
        self.usersViewModels = []
        self.users = []
        self.subscriptions = []
    }

    func bind(_ view: UsersScreenViewProtocol) {
        self.view = view
        loadData()
    }

    func view(_ view: UsersScreenViewProtocol, didSelectItemAt indexPath: IndexPath) {
        let viewModel = usersViewModels[indexPath.row]
        if let user = users.first(where: { $0.userId == viewModel.id }) {
            router.showUserPosts(for: user)
        }
    }

    // MARK: - API

    private func loadData() {
        usersApiService.loadUsers()
            .zip(postsApiService.loadPosts())
            .subscribe { [weak self] users, posts in
                self?.handleData(users: users, posts: posts)
            } onFailure: { error in
                print(error)
            }
            .store(in: &subscriptions)
    }

    private func handleData(users: [User], posts: [Post]) {
        let uniquePosts = posts.unique
        self.users = users.map({
            var user = $0
            let userPosts = uniquePosts.filter({ $0.userId == user.userId })
            user.posts = userPosts

            return user
        })
        usersViewModels = self.users.map{ UserCellViewModel(user: $0) }
        view?.update()
    }
}
