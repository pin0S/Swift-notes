//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Peter Lynch on 7/2/2023.
//

import SwiftUI

struct ContentView: View {
    // set an array for r p s
    let options = ["Rock", "Paper", "Scissors"]
    let winningOptions = ["Paper", "Scissors", "Rock"]
    // set variable for computers choice
    @State private var computerChoice = Int.random(in: 0...2)
    // set variable for player choice
    @State private var playerChoice = 0
    // set win or lose turn
    @State private var shouldWin = true
    // set score
    @State private var score = 0
    // set question count
    // set game state
    
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Text(shouldWin ? "You Should Win" : "You Should Lose")
            Spacer()
            Text("Computer chooses: \(options[computerChoice])").font(.title)
            Text("vs.")
                .font(.title3)
            Text("You choose \(playerChoice)").font(.title)
            Spacer()
            VStack {
                ForEach(winningOptions, id: \.self) {option in
                    Button( "\(option)", action: {logic(playerChoice: winningOptions.firstIndex(of: option) ?? 0)})
                }
            }
        }.padding()
    }
    
    func logic(playerChoice: Int) {
        print("player \(playerChoice)")
        print("computer \(computerChoice)")
        if shouldWin == true {
            print("should win")
            if playerChoice == computerChoice {
                print("Player wins this round")
                score += 1
            } else {
                print("Player loses this round")
                score -= 1
            }
        } else {
            print("should lose")
            if playerChoice != computerChoice {
                print("Player wins this round")
                score += 1
            } else {
                print("Player loses this round")
                score -= 1
            }
        }
        
        computerChoice = Int.random(in: 0...2)
        shouldWin = !shouldWin
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
