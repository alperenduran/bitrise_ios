//
//  BuildRequestBody.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct BuildRequestParams: Encodable {
    let branch: String
    let workflow: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case branch
        case workflow = "workflow_id"
        case message = "commit_message"
    }
}
