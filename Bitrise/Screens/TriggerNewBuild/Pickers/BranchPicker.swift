//
//  BranchPicker.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BranchPicker: View {
    var data: [String]
    @State var selection: Int = 0
    var body: some View {
        Picker(selection: $selection, label: Text("Branch")) {
            ForEach(0 ..< self.data.count) {
                Text(self.data[$0]).tag($0)
            }
        }
    }
}

struct BranchPicker_Previews: PreviewProvider {
    static var previews: some View {
        BranchPicker(data: ["master"], selection: 0)
    }
}
