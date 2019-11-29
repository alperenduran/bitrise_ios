//
//  TriggerBuildViewModel.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

class TriggerBuildViewModel: ObservableObject {
    @Published var isSuccess: Bool = false
    @Published var branchList: [String] = []
    @Published var workflowList: [String] = []
    
    func triggerBuild(slug: String, branch: String, workflow: String, message: String) {
        let endpoint = "https://api.bitrise.io/v0.1/apps/\(slug)/builds"
        var request = URLRequest.createPostRequest(endpoint: endpoint, headers: [:])
        let params = BuildRequestParams(branch: branch, workflow: workflow, message: message)
        let hookInfo = HookType(type: "bitrise")
        let build = BuildRequestBody(params: params, hookInfo: hookInfo)
        request.httpBody = try! JSONEncoder().encode(build)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                let response = response as! HTTPURLResponse
                if response.statusCode == 200 {
                    self.isSuccess.toggle()
                }
            }
        }.resume()
    }
    
    func getBranches(slug: String) {
        let endpoint = "https://api.bitrise.io/v0.1/apps/\(slug)/branches"
        let request = URLRequest.createGetRequest(endpoint: endpoint, headers: [:])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(BranchesResponse.self, from: data!)
                self.branchList = data.data
            }
        }.resume()
    }
    
    func getWorkflows(slug: String) {
        let endpoint = "https://api.bitrise.io/v0.1/apps/\(slug)/build-workflows"
        let request = URLRequest.createGetRequest(endpoint: endpoint, headers: [:])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(WorkflowsResponse.self, from: data!)
                self.workflowList = data.data
            }
        }.resume()
    }
}
