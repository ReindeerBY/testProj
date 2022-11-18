//
//  UserApiService.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import Combine

protocol UsersApiServiceProtocol {
    func loadUsers() -> AnyPublisher<[User], Error>
}

class UsersApiService: BaseApiService, UsersApiServiceProtocol {

    private let url = URL(string: "https://my-json-server.typicode.com/SharminSirajudeen/test_resources/users")

    func loadUsers() -> AnyPublisher<[User], Error> {
        guard let url = url else {
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        return loadData(url: url)
    }
}
