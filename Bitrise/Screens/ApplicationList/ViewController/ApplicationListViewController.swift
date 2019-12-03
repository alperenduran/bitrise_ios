//
//  ApplicationListViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI
import Introspect

struct ApplicationListViewController: View {
    @ObservedObject var viewModel = ApplicationListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ApplicationListView(applications: viewModel.applications)
                    .navigationBarTitle("Applications")
                    .navigationBarItems(trailing:
                        Button("Refresh") {
                            self.viewModel.fetchApplications()
                        }
                )
                NavigationLink(destination: AddTokenViewController()) {
                    AddTokenButton()
                        .padding()
                }
            }
        }
        .introspectNavigationController { view in
            let purple = UIColor(named: "appPurpleColor")
            view.navigationBar.tintColor = purple
            let textAttributes = [NSAttributedString.Key.foregroundColor: purple]
            view.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
            view.navigationBar.largeTitleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        }
        .onAppear {
            self.viewModel.fetchApplications()
        }
    }
}

struct ApplicationListViewController_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListViewController()
    }
}
