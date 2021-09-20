//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Karem on 9/20/21.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: ExpensesViewModel
    @Environment(\.presentationMode) var presentation

    @State private var name:String = ""
    @State private var type:String = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]

    var body: some View {
           NavigationView {
               Form {
                   TextField("Name", text: $name)
                   Picker("Type", selection: $type) {
                       ForEach(Self.types, id: \.self) {
                           Text($0)
                       }
                   }
                   TextField("Amount", text: $amount)
                       .keyboardType(.numberPad)
               }
               .navigationBarTitle("Add new expense")
               .navigationBarItems(trailing: Button(action: {
                if let amount = Double(amount){
                    self.expenses.expenses.append(ExpenseItem(name: name, type: type, amount: amount))
                    self.presentation.wrappedValue.dismiss()
                }
                
               }, label: {
                Text("Save")
               }))
           }
       }
    
    
   }

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        let expensesViewModel = ExpensesViewModel()
        AddExpenseView(expenses: expensesViewModel)
    }
}
