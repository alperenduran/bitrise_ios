//
//  BuildCard.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BuildCard: View {
    let application: Application
    let build: Build
    @State var show = false
    
    var body: some View {
        HStack {
            BuildStatusView(label: build.statusLabel, color: build.statusColor)
                .frame(height: build.status == .inProgress ? 200 : 145)
            VStack(alignment: .leading) {
                BuildNameLabel(application: application)
                    .padding(.top)
                VStack {
                    HStack {
                        BranchLabel(branchName: build.branch)
                            .layoutPriority(1000)
                        Spacer()
                        WorkflowLabel(workflow: build.workflow)
                            .layoutPriority(1000)
                    }
                    HStack {
                        BuildNumberLabel(buildNumber: build.buildNumber)
                        Spacer()
                        BuildStartTimeLabel(time: build.startTime)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                if (build.status == .inProgress) {
                    Button(action: {
                        self.abortBuild(
                            appSlug: self.application.id,
                            buildSlug: self.build.id
                        )
                    }) {
                        Text("Abort")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 100)
                            .padding(.vertical, 13)
                            .background(Color("failedRed"))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(build.statusColor, lineWidth: 2)
        )
    }
}


struct BuildCard_Previews: PreviewProvider {
    static var previews: some View {
        BuildCard(application: mockData.data[2], build: mockDetail.data[0])
    }
}

extension BuildCard {
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
