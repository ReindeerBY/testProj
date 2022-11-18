//
//  BaseApiService.swift
//  TestProject
//
//  Created by Evgeniy on 17.11.22.
//

import Foundation
import Combine

class BaseApiService {

    func loadData<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
