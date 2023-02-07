//
//  ContentView.swift
//  FAroundAndFindOut
//
//  Created by Peter Lynch on 6/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
