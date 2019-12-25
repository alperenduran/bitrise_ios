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
    @State var createButtonTapped = false
    let application: Application
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            BuildListView(application: self.application, builds: viewModel.builds)
            Button(action: { self.createButtonTapped = true }) {
                CreateBuildCell()
                    .padding()
            }
            .sheet(isPresented: $createButtonTapped) {
                SelectBranchViewController(application: self.application)
            }
        }
        .navigationBarItems(trailing:
            Button("Refresh") {
                self.viewModel.fetchBuilds(slug: self.application.id)
            }
        )
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
