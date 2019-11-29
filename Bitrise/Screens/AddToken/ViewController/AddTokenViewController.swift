//
//  AddTokenViewController.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct AddTokenViewController: View {
    @ObservedObject var viewModel = AddTokenViewModel()
    var body: some View {
        Form {
            Section(header: Text("Your Token")) {
                TextField("Paste your token here", text: $viewModel.token)
            }
            Section {
                Button(action: {
                    
                }) {
                    Text("Add Token")
                        .foregroundColor(Color("appPurpleColor"))
                }
            }
        }
    .navigationBarTitle("Add Token")
    }
}

struct AddTokenViewController_Previews: PreviewProvider {
    static var previews: some View {
        AddTokenViewController()
    }
}
