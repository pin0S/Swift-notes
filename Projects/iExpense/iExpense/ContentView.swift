//
//  ContentView.swift
//  iExpense
//
//  Created by Peter Lynch on 15/2/2023.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

struct ContentView: View {
    @StateObject var expenses = Expenses() 
    @State private var showingAddExpense = false
    
    private var localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Section {
                        if item.type == "personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                if item.amount < 10 {
                                    Text(item.amount, format: localCurrency)
                                        .background(.green)
                                } else if item.amount < 100 {
                                    Text(item.amount, format: localCurrency)
                                        .background(.yellow)
                                } else {
                                    Text(item.amount, format: localCurrency)
                                        .background(.red)
                                }
                            }
                        }
                    }
                    
                }.onDelete(perform: removeItems)
            }
                .navigationTitle("iExpense")
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            
        }
        
        func removeItems(at offsets: IndexSet) {
            expenses.items.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
