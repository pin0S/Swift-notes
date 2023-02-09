//
//  ContentView.swift
//  WordScramble
//
//  Created by Peter Lynch on 9/2/2023.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
