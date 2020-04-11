//
//  BuildCard.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI
import Introspect

struct BuildCard: View {
    let application: Application
    let build: Build
    @State var show = false
    @State var isPresented = false
    var body: some View {
        HStack {
            BuildStatusView(label: build.statusLabel, color: build.statusColor)
                .frame(height: 145)
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
            }
        }.onTapGesture {
            self.isPresented.toggle()
        }
        .sheet(isPresented: self.$isPresented) {
            NavigationView {
                BuildSummaryViewController(
                    branch: self.build.branch,
                    workflow: self.build.workflow,
                    application: self.application,
                    buildMessage: "Restart Build #\(self.build.buildNumber)"
                ).navigationBarTitle("Build Summary")
                    .introspectNavigationController { view in
                        let purple = UIColor(named: "appPurpleColor")
                        view.navigationBar.tintColor = purple
                        let textAttributes = [NSAttributedString.Key.foregroundColor: purple]
                        view.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
                        view.navigationBar.largeTitleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
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


