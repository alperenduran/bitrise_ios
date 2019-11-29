//
//  BuildAbortBody.swift
//  Bitrise
//
//  Created by Alperen Duran on 29.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct BuildAbortBody: Encodable {
    let abort: Bool
    
    enum CodingKeys: String, CodingKey {
        case abort = "abort_with_success"
    }
}
