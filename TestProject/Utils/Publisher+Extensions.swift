//
//  Publisher+Extensions.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import Foundation
import Combine

extension Publisher {

    func subscribe(onValue: @escaping (Output) -> (),
                   onFailure: ((Failure) -> ())?,
                   onCompleted: (() -> ())? = nil) -> AnyCancellable {
        return sink(receiveCompletion: { (completion) in
            switch completion {
            case.finished:
                onCompleted?()
                break
            case .failure(let error):
                onFailure?(error)
            }
        }, receiveValue: { value in
            onValue(value)
        })
    }
}
