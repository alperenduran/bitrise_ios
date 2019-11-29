//
//  SelectWorkflowViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct SelectWorkflowViewController: View {
    @ObservedObject var viewModel = TriggerBuildViewModel()
    let branch: String
    let application: Application
    var body: some View {
        List(viewModel.workflowList, id: \.self) { workflow in
            NavigationLink(destination: BuildSummaryViewController(branch: self.branch, workflow: workflow, application: self.application)) {
             Text(workflow)
            }
        }
        .onAppear {
            self.viewModel.getWorkflows(slug: self.application.id)
        }
        .navigationBarTitle("Select Workflow")
    }
}

struct SelectWorkflowViewController_Previews: PreviewProvider {
    static var previews: some View {
        SelectWorkflowViewController(
            branch: "master",
            application: mockData.data[2]
        )
    }
}
