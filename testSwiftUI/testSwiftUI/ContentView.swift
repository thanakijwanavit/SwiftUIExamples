//
//  ContentView.swift
//  testSwiftUI
//
//  Created by nic Wanavit on 11/23/19.
//  Copyright © 2019 Wanavit. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(alignment: .leading) {

            Text("Hello, Wo")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.green)
                .padding(.all)
            Spacer()
            HStack(alignment: .top) {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                    .padding(.all)
                Spacer()
                Text("second label")
                .bold()
                .foregroundColor(.orange)
                    .underline()
                    .padding(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
