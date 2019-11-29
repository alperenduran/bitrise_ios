//
//  BuildSummaryViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BuildSummaryViewController: View {
    let branch: String
    let workflow: String
    let application: Application
    @ObservedObject var viewModel = TriggerBuildViewModel()
    @State private var showAlert = false
    @State var buildMessage: String = ""
    var body: some View {
        Form {
            Section(header: Text("Branch")) {
                Text(branch)
            }
            Section(header: Text("Workflow")) {
                Text(workflow)
            }
            Section(header: Text("Build Message")) {
                TextField("Optional", text: $buildMessage)
            }
            Section {
                Button(action: {
                    self.viewModel.triggerBuild(
                        slug: self.application.id,
                        branch: self.branch,
                        workflow: self.workflow,
                        message: self.buildMessage
                    )
                    self.showAlert.toggle()
                }) {
                    Text("Start Build")
                        .foregroundColor(Color("appPurpleColor"))
                }
            }
        }
        .navigationBarTitle("Build Summary")
        .alert(isPresented: $showAlert) { () -> Alert in
            Alert(
                title: Text("Successful"),
                message: Text("Build triggered successfully."),
                dismissButton: .default(Text("Okey"))
            )
        }
    }
}
    struct BuildSummaryViewController_Previews: PreviewProvider {
        static var previews: some View {
            BuildSummaryViewController(
                branch: "", workflow: "",
                application: mockData.data[2]
            )
        }
}

