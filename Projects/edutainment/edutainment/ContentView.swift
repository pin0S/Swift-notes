//
//  ContentView.swift
//  edutainment
//
//  Created by Peter Lynch on 12/2/2023.
//

import SwiftUI

struct Question {
    var question: String
    var answer: Bool
}

struct ContentView: View {
    @State private var timesTable = 5
    @State private var numberOfQuestions = [5, 10, 15, 20]
    @State private var questionsAmount = 5
    @State private var gameActive = false
    @State var answer = 0
    @State var questions: [Question] = []
    @State var answers = [Int]()
    @State var currentIndex = 0
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Times table", selection: $timesTable) {
                        ForEach(1..<13) {
                            Text("\($0)")
                        }
                    }
                    
                    Section("How many question you want to answer") {
                        Picker("Questions", selection: $questionsAmount) {
                            ForEach(numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    Button("Practice") {
                        generateQuestions()
                    }
                    
                    if gameActive {
                        ForEach(0..<questions.count, id: \.self) { index in
                            if self.currentIndex == index {
                                VStack {
                                    Text("\(self.questions[index].question)")
                                    TextField("Answer", value: self.$answer, format: .number)
                                        .keyboardType(.numberPad)
                                        .toolbar {
                                            ToolbarItemGroup(placement: .keyboard) {
                                                Spacer()
                                                Button("Done") {
                                                    answers.append(self.answer)
                                                    self.currentIndex += 1
                                                    if self.currentIndex == questions.count {
                                                        gameActive = false
                                                    }
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                    
                    
                    if answers.count == questionsAmount {
                        ForEach(0..<answer.count, id: \.self) {index in
                            print(self.answers[index] == questions[index].answer)
                        }
                    }
                }
            }
            
            
        }
        .navigationTitle("Edutainment")
    }
    
    func generateQuestions() {
        let numbers = 1...12
        questions.removeAll()
        
        for _ in 1...questionsAmount {
            if let randomNumber = numbers.randomElement() {
                let tempNum = (timesTable + 1) * randomNumber
                questions.append(Question(question: "\(timesTable + 1) * \(randomNumber)", answer: tempNum))
            }
        }
        
        gameActive = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
