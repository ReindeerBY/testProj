//
//  Array+Extensions.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

extension Array where Element: Equatable {

    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
