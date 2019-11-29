//
//  ApplicationDetailViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BuildListViewController: View {
    @ObservedObject var viewModel = BuildListViewModel()
    let application: Application
    var body: some View {
        VStack {
            BuildListView(application: self.application, builds: viewModel.builds)
            NavigationLink(
            destination: SelectBranchViewController(application: self.application)) {
                CreateBuildCell()
                 .padding()
            }
        }
        .navigationBarTitle("Builds")
        .onAppear {
            self.viewModel.fetchBuilds(slug: self.application.id)
        }
    }
}

struct BuildListViewController_Previews: PreviewProvider {
    static var previews: some View {
        BuildListViewController(application: mockData.data[2])
    }
}
