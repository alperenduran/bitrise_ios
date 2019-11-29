//
//  ApplicationListViewModel.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

class ApplicationListViewModel: ObservableObject {
    @Published var applications: [Application] = []
    func fetchApplications() {
        let endpoint = "https://api.bitrise.io/v0.1/apps?sort_by=created_at"
        let request = URLRequest.createGetRequest(endpoint: endpoint, headers: [:])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(ApplicationListResponse.self, from: data!)
                self.applications = data.data
            }
        }.resume()
    }
}
