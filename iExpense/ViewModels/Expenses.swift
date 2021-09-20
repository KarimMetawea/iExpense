//
//  Expenses.swift
//  iExpense
//
//  Created by Karem on 9/20/21.
//

import Foundation

class ExpensesViewModel: ObservableObject {
    @Published var expenses:[ExpenseItem] = []  {
        didSet{
            let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(expenses) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    }
    
    
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.expenses = decoded
                return
            }
        }
        self.expenses = []
    }
    
    
}
