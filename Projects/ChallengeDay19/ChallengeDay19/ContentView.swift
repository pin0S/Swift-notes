//
//  ContentView.swift
//  ChallengeDay19
//
//  Created by Peter Lynch on 5/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State var initialValue: Double = 0.00
    @State private var initialUnit = "Kilometers"
    @State private var outputUnit = "Miles"
    let units = ["Meters", "Kilometers", "Yards", "Feet", "Miles"]
    
    var convertedValue: Double {
        if outputUnit == "Miles" && initialUnit == "Kilometers" {
            let value = initialValue / 1.69
            return value
        }
        
        return 0.00
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Inital Value", value: $initialValue,  format: .number)
                }
                
                
                Section {
                    Picker("Initial Unit", selection: $initialUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Initial Unit of Measurement")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output Unit of Measurement")
                }
                
                Text("\(convertedValue)")
                
            }
            }.navigationTitle("Distance Conversion")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
