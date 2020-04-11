//
//  BuildListView.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BuildListView: View {
    let application: Application
    let builds: [Build]
    var body: some View {
        List(builds, id: \.id) { build in
            if build.status == .inProgress {
                BuildCard(application: self.application, build: build)
                    .padding(.vertical)
                    .contextMenu {
                        Button(action: {
                            self.abortBuild(
                                appSlug: self.application.id,
                                buildSlug: build.id
                            )
                        }) {
                            Text("Abort")
                        }
                }
            } else {
                BuildCard(application: self.application, build: build)
                    .padding(.vertical)
            }
        }
    }
}


struct BuildListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildListView(application: mockData.data[2], builds: mockDetail.data)
    }
}

extension BuildListView {
    func abortBuild(appSlug: String, buildSlug: String) {
        let endpoint = "https://api.bitrise.io/v0.1/apps/\(appSlug)/builds/\(buildSlug)/abort"
        var request = URLRequest.createPostRequest(endpoint: endpoint, headers: [:])
        let build = BuildAbortBody(abort: true)
        request.httpBody = try! JSONEncoder().encode(build)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            }
        }.resume()
    }
}
