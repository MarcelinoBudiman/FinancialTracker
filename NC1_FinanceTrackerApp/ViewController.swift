//
//  ViewController.swift
//  NC1_FinanceTrackerApp
//
//  Created by Marcelino Budiman on 27/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    //Expenses
    @IBOutlet weak var viewExpenses: UIView!
    @IBOutlet weak var lblExpenses: UILabel!
    @IBOutlet weak var lblUserExpenses: UILabel!
    
    //Income
    @IBOutlet weak var viewIncome: UIView!
    @IBOutlet weak var lblIncome: UILabel!
    @IBOutlet weak var lblUserIncome: UILabel!
    
    //Balance
    @IBOutlet weak var viewBalance: UIView!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblUserBalance: UILabel!
    
    //Most Spend
    @IBOutlet weak var viewMostSpend: UIView!
    @IBOutlet weak var lblMostSpend: UILabel!
    
    // Define Transaction
    var transactions: [Transaction] = []
    
    //Extra Variables
    var expenses: Int = 0
    var income: Int = 0
    var balance: Int = 0
    var food: Int = 0
    var transportation: Int = 0
    var shopping: Int = 0
    var sortedKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTopTitle()
        setupUI()
        
        
        // Seeder Transaction
        transactions = TransactionFeeder().seedTransaction()
        
        loadExpenses()
        loadIncome()
        loadBalance()
        loadHighestExpenses()
        
    }
    
    private func configureTopTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Financial Summary"
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    private func setupUI(){
        //Set Expenses
        viewExpenses.layer.cornerRadius = 10
        viewExpenses.layer.shadowColor = UIColor.black.cgColor
        viewExpenses.layer.shadowOpacity = 0.5
        viewExpenses.layer.shadowOffset = .zero
        viewExpenses.layer.shadowRadius = 5
        
        lblExpenses.text = "Your Expenses"
        
        lblExpenses.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        
        lblUserExpenses.text = "Rp 10.000.000,-"
        
        lblUserExpenses.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        // Set Income
        viewIncome.layer.cornerRadius = 10
        viewIncome.layer.shadowColor = UIColor.black.cgColor
        viewIncome.layer.shadowOpacity = 0.5
        viewIncome.layer.shadowOffset = .zero
        viewIncome.layer.shadowRadius = 5
        
        lblIncome.text = "Your Income"

        lblIncome.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        
        lblUserIncome.text = "Rp 50.000.000,-"
        
        lblUserIncome.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        // Set Balance
        viewBalance.layer.cornerRadius = 10
        viewBalance.layer.shadowColor = UIColor.black.cgColor
        viewBalance.layer.shadowOpacity = 0.5
        viewBalance.layer.shadowOffset = .zero
        viewBalance.layer.shadowRadius = 5
        
        lblBalance.text = "Your Balance"

        lblBalance.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        
        lblUserBalance.text = "Rp 40.000.000,-"
        
        lblUserBalance.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        // Set Most Spend Lbl
        viewMostSpend.layer.cornerRadius = 10
        viewMostSpend.layer.shadowColor = UIColor.black.cgColor
        viewMostSpend.layer.shadowOpacity = 0.5
        viewMostSpend.layer.shadowOffset = .zero
        viewMostSpend.layer.shadowRadius = 5
        
        lblMostSpend.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        lblMostSpend.textColor = UIColor.red
    }
    
    private func loadExpenses(){
        for t in transactions {
            if t.type == "Expenses"{
                expenses += t.total
                if t.category == "Food" {
                    food += t.total
                }else if t.category == "Transportation" {
                    transportation += t.total
                }else if t.category == "Shopping" {
                    shopping += t.total
                }
            }
        }

        let formattedExpenses = expenses.formattedWithSeparator
        lblUserExpenses.text = "Rp \(formattedExpenses),-"
    }
    
    private func loadIncome(){
        for t in transactions {
            if t.type == "Income"{
                income += t.total
            }
        }
        
        let formattedIncome = income.formattedWithSeparator
        lblUserIncome.text = "Rp \(formattedIncome),-"
        
    }
    
    private func loadBalance(){
        balance = income - expenses
        
        let formattedBalance = balance.formattedWithSeparator
        lblUserBalance.text = "Rp \(formattedBalance),-"
    }
    
    private func loadHighestExpenses(){
        // Get Highest Expense Category
        let categories = ["Food":food, "Transportation": transportation, "Shopping":shopping]
        
        sortedKeys = Array(categories.keys).sorted(by: { categories[$0]! > categories[$1]! })
        
        lblMostSpend.text = sortedKeys[0]
        
    }

}

