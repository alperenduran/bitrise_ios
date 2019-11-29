//
//  ApplicationListResponse.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct ApplicationListResponse: Decodable {
    let data: [Application]
}
