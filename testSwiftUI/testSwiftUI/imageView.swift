//
//  imageView.swift
//  testSwiftUI
//
//  Created by nic Wanavit on 11/23/19.
//  Copyright © 2019 Wanavit. All rights reserved.
//

import SwiftUI

struct imageView: View {
    var body: some View {
        Image("randomImage")
        .scaledToFill()
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
