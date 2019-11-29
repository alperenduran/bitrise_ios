//
//  ApplicationListView.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct ApplicationListView: View {
    var applications: [Application]
    var body: some View {
        List(applications, id: \.id) { application in
            NavigationLink(destination: BuildListViewController(application: application)) {
                 ApplicationListItemView(application: application)
            }
        }
    }
}

struct ApplicationListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListView(applications: mockData.data)
    }
}
