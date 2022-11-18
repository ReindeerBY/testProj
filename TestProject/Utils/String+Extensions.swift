//
//  String+Extensions.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import Foundation

extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
