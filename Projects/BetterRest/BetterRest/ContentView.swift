//
//  ContentView.swift
//  BetterRest
//
//  Created by Peter Lynch on 8/2/2023.
//

import CoreML
import SwiftUI


struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                VStack(alignment: .leading, spacing: 0)  {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0)  {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                
                    VStack(alignment: .leading, spacing: 0)  {
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Picker("Coffees", selection: $coffeeAmount) {
                            ForEach((1...20), id: \.self) {
                                $0 == 1 ? Text("\($0) cup") :  Text("\($0) cups")
                            }
                        }
                    }
                    
                    
                    Section {
                        Text("Your Ideal betime is \(calculateBedtime())")
                    }
                    
                }
            }.navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() -> String {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        var sleepMessage: String
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            sleepMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            sleepMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        
        return sleepMessage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
