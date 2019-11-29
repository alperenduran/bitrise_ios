//
//  ApplicationListItemView.swift
//  Bitrise
//
//  Created by Alperen Duran on 15.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct ApplicationListItemView: View {
    let application: Application
    var body: some View {
        HStack {
            ApplicationAvatarImage(imageUrl: application.avatar ?? "")
            VStack(alignment: .leading) {
                ApplicationTitleLabel(title: application.title)
                ApplicationTypeLabel(projectType: application.projectType)
            }
        }
    }
}

struct ApplicationListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListItemView(application: mockData.data[2])
    }
}
