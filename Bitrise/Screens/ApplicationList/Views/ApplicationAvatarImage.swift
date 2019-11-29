//
//  ApplicationAvatarImage.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ApplicationAvatarImage: View {
    let imageUrl: String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .placeholder {
                PlaceholderPhoto()
            }
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
            .cornerRadius(5)
    }
}

struct ApplicationAvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationAvatarImage(imageUrl: mockData.data[2].avatar!)
    }
}
