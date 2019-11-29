//
//  ApplicationDetailViewModel.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation

class BuildListViewModel: ObservableObject {
    @Published var builds: [Build] = []
    func fetchBuilds(slug: String) {
        let endpoint = "https://api.bitrise.io/v0.1/apps/\(slug)/builds?sort_by=running_first"
        let request = URLRequest.createGetRequest(endpoint: endpoint, headers: [:])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(ApplicationDetailsResponse.self, from: data!)
                self.builds = data.data
            }
        }.resume()
    }
}
