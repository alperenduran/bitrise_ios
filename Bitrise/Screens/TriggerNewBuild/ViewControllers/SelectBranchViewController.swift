//
//  TriggerBuildViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct SelectBranchViewController: View {
    @ObservedObject var viewModel = TriggerBuildViewModel()
    let application: Application
    var body: some View {
        NavigationView {
            List(viewModel.branchList, id: \.self) { branch in
                NavigationLink(destination: SelectWorkflowViewController(branch: branch, application: self.application)) {
                    Text(branch)
                }
            }
            .onAppear {
                self.viewModel.getBranches(slug: self.application.id)
            }
            .navigationBarItems(trailing:
                Button("Refresh") {
                    self.viewModel.getBranches(slug: self.application.id)
                }
            )
                .navigationBarTitle("Select Branch")
                .introspectNavigationController { view in
                    let purple = UIColor(named: "appPurpleColor")
                    view.navigationBar.tintColor = purple
                    let textAttributes = [NSAttributedString.Key.foregroundColor: purple]
                    view.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
                    view.navigationBar.largeTitleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
            }
        }
    }
}
struct SelectBranchViewController_Previews: PreviewProvider {
    static var previews: some View {
        SelectBranchViewController(application: mockData.data[2])
    }
}
