//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Karem on 9/20/21.
//

import Foundation

struct ExpenseItem:Identifiable,Codable {
    var id: UUID = UUID.init()
    let name:String
    let type:String
    let amount:Double
}
