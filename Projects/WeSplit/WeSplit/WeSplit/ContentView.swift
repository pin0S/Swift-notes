//
//  ContentView.swift
//  WeSplit
//
//  Created by Peter Lynch on 3/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var total: Double = 0.0
    let tipPercentages = [0, 10, 15, 20, 25]
    @FocusState private var amountIsFocused: Bool
    private var localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")

    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: localCurrency ).keyboardType(.decimalPad).focused($amountIsFocused)

                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section {

                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total Amount")
                }
                
                Section {
                    Text(totalPerPerson, format: localCurrency)
                } header: {
                    Text("Amount per person")
                }
                   
                
            }.navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
