//
//  ActivityIndicator.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI

struct PlaceholderPhoto: View {
    var body: some View {
        Image("alperen")
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
            .cornerRadius(25)
    }
}

struct PlaceholderPhoto_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderPhoto()
    }
}
