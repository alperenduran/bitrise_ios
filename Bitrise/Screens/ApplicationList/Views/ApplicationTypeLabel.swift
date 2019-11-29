//
//  ApplicationTypeLabel.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct ApplicationTypeLabel: View {
    let projectType: String?
    var body: some View {
        Text(projectType ?? "Not Specified")
            .fontWeight(.regular)
    }
}

struct ApplicationTypeLabel_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationTypeLabel(projectType: mockData.data[2].projectType)
    }
}
