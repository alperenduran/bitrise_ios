//
//  BuildNameLabel.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BuildNameLabel: View {
    let application: Application
    var body: some View {
        ApplicationListItemView(application: application)
    }
}

struct BuildNameLabel_Previews: PreviewProvider {
    static var previews: some View {
        BuildNameLabel(application: mockData.data[2])
    }
}
