//
//  AddTokenViewModel.swift
//  Bitrise
//
//  Created by Alperen Duran on 20.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI
import Combine

class AddTokenViewModel: ObservableObject {
    private static let userDefaultTextKey = "token"
    @Published var token = UserDefaults.standard.string(forKey: AddTokenViewModel.userDefaultTextKey) ?? ""
    private var canc: AnyCancellable!
    
    init() {
        canc = $token.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: AddTokenViewModel.userDefaultTextKey)
            
        }
    }
    deinit {
        canc.cancel()
    }
}

