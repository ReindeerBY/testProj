//
//  PostsScreenViewModel.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation

protocol PostsScreenViewModelProtocol {

    func bind(_ view: PostsScreenViewProtocol)

    var user: User { get }
    var userPostsViewModels: [UserPostsCellViewModel] { get }
    var userPostsHeaderViewModel: UserPostsHeaderViewModel { get }
}

class PostsScreenViewModel: PostsScreenViewModelProtocol {
    private weak var view: PostsScreenViewProtocol!

    var user: User
    var userPostsViewModels: [UserPostsCellViewModel]
    var userPostsHeaderViewModel: UserPostsHeaderViewModel

    init(user: User) {
        self.user = user
        self.userPostsHeaderViewModel = UserPostsHeaderViewModel(imageString: user.url)
        self.userPostsViewModels = user.posts?.map{ UserPostsCellViewModel(post: $0) } ?? []
    }

    func bind(_ view: PostsScreenViewProtocol) {
        self.view = view
        self.view?.update()
    }
}
