//
//  ContentView.swift
//  iExpense
//
//  Created by Karem on 9/20/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenseViewModel = ExpensesViewModel()
    @State private var showingAddExpense = false

    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(expenseViewModel.expenses) { item in
                    HStack {
                          VStack(alignment: .leading) {
                              Text(item.name)
                                  .font(.headline)
                              Text(item.type)
                          }
                          Spacer()
                          Text("$\(item.amount , specifier: "%g")")
                      }
                }
                .onDelete(perform: removeItem(offset:))
            }.navigationTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense, content: {
                AddExpenseView(expenses: self.expenseViewModel)
            })
        }
       
    }
    
    func removeItem(offset:IndexSet){
        self.expenseViewModel.expenses.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
