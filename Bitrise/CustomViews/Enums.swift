//
//  Enums.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

enum Status: Int, Decodable {
    case inProgress = 0
    case successful = 1
    case failed = 2
    case abortedWithFailure = 3
    case abortedWithSuccess = 4
}
