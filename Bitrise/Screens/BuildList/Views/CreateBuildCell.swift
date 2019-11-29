//
//  CreateBuildCell.swift
//  Bitrise
//
//  Created by Alperen Duran on 17.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct CreateBuildCell: View {
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .imageScale(.large)
                .foregroundColor(Color("appPurpleColor"))
            Text("Start New Build")
                .foregroundColor(Color("appPurpleColor"))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("appPurpleColor"), lineWidth: 2)
        )
    }
}

struct CreateBuildCell_Previews: PreviewProvider {
    static var previews: some View {
        CreateBuildCell()
    }
}
