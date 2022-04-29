//
//  TransactionModel.swift
//  NC1_FinanceTrackerApp
//
//  Created by Marcelino Budiman on 28/04/22.
//

import Foundation
import UIKit

struct Transaction{
    var total: Int
    var category: String
    var notes: String?
    var date: String
    var type: String
}

struct TransactionFeeder{
    func seedTransaction() -> [Transaction] {
        return [
            Transaction(total: 30000, category: "Food", notes: "Ayam Gepuk", date: "22-10-2022", type: "Expenses"),
            Transaction(total: 200000, category: "Transportation", notes: "Bensin", date: "20-10-2022", type: "Expenses"),
            Transaction(total: 500000, category: "Shopping", notes: "Baju HnM", date: "15-10-2022", type: "Expenses"),
            Transaction(total: 2500000, category: "Salary", notes: "Gajian", date: "22-10-2022", type: "Income")
        ]
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
