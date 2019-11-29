//
//  AddTokenButton.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct AddTokenButton: View {
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .imageScale(.large)
                .foregroundColor(Color("appPurpleColor"))
            Text("Add Token")
                .foregroundColor(Color("appPurpleColor"))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("appPurpleColor"), lineWidth: 2)
        )
    }
}

struct AddTokenButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTokenButton()
    }
}
