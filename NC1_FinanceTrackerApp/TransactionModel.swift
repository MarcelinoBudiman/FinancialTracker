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
    var date: Date?
    var type: String
}
 
extension Date {

    static func from(year: Int, month: Int, day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: "WIB")
        return calendar.date(from: dateComponents) ?? nil
    }
}

struct TransactionFeeder{
    func seedTransaction() -> [Transaction] {
        return [
            Transaction(total: 30000, category: "Food", notes: "Ayam Gepuk", date: Date.from(year: 2022, month: 10, day: 22) ?? nil, type: "Expenses"),
            Transaction(total: 200000, category: "Transportation", notes: "Bensin", date: Date.from(year: 2022, month: 10, day: 20) ?? nil, type: "Expenses"),
            Transaction(total: 500000, category: "Shopping", notes: "Baju HnM", date: Date.from(year: 2022, month: 10, day: 15) ?? nil, type: "Expenses"),
            Transaction(total: 2500000, category: "Salary", notes: "Gajian", date: Date.from(year: 2022, month: 10, day: 22) ?? nil, type: "Income")
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
