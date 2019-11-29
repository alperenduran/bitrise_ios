//
//  ApplicationTitleLabel.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct ApplicationTitleLabel: View {
    let title: String
    var body: some View {
        Text(title)
            .fontWeight(.bold)
    }
}

struct ApplicationTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationTitleLabel(title: mockData.data[2].title)
    }
}
