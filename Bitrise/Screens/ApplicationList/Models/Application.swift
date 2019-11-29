//
//  Application.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

struct Application: Decodable, Identifiable {
    let id: String
    let title: String
    let projectType: String?
    let owner: String
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case title
        case projectType = "project_type"
        case owner = "repo_owner"
        case avatar = "avatar_url"
    }
}
