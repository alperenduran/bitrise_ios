//
//  Request.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

var token = UserDefaults.standard.object(forKey: "token") ?? ""

extension URLRequest {
    static func createGetRequest(
        endpoint: String,
        headers: [String: Any]
    ) -> URLRequest {
        let url = URL(string: endpoint)
        var request = URLRequest.init(url: url!)
        request.addValue(token as! String, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        headers.forEach { (key, value) in
            request.addValue(value as! String, forHTTPHeaderField: key)
        }
        return request
    }
    
    static func createPostRequest(
        endpoint: String,
        headers: [String: Any]
    ) -> URLRequest {
        let url = URL(string: endpoint)
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        request.addValue(token as! String, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        headers.forEach { (key, value) in
            request.addValue(value as! String, forHTTPHeaderField: key)
        }
        return request
    }
}
