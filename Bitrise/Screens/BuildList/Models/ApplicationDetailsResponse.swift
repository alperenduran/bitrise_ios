//
//  ApplicationDetailsResponse.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct ApplicationDetailsResponse: Decodable {
    let data: [Build]
}
