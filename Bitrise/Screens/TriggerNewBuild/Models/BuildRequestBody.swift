//
//  BuildRequestBody.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct BuildRequestBody: Encodable {
    let params: BuildRequestParams
    let hookInfo: HookType
    
    enum CodingKeys: String, CodingKey {
        case params = "build_params"
        case hookInfo = "hook_info"
    }
}

struct HookType: Encodable {
    let type: String
}
