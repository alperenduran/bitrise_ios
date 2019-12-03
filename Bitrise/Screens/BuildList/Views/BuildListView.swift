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
            NavigationLink(destination: BuildSummaryViewController(
                branch: build.branch,
                workflow: build.workflow,
                application: self.application,
                buildMessage: "Restart Build #\(build.buildNumber)"
                )
            ) {
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
